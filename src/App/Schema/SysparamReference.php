<?php 

namespace App\Schema;

use \Norm\Schema\Reference;
use Norm\Norm;
class SysparamReference extends Reference{

    public function __construct($name = null, $label = null){

        parent::__construct($name,$label);

        $this['foreign'] = 'Sysparam';
        $this['foreignLabel'] = 'value';
        $this['foreignKey'] = 'key';

    }

    public function setGroups($groups){
        $this['groups'] = $groups;
        return $this;
    }


    public function optionLabel($key, $entry)
    {
        if (is_scalar($entry)) {
            $label = $entry;
        } elseif ($this['foreignLabel'] instanceof \Closure) {
            $getLabel = $this['foreignLabel'];
            $label = $getLabel($entry);
        } else {
            $label = $entry[$this['foreignLabel']];
        }

        return $label;
    }

    public function optionData()
    {
        
        $cursor =  Norm::factory($this['foreign'])->find(array('groups' => $this['groups']));
        

        if (isset($this['bySort'])) {
            $cursor->sort($this['bySort']);
        }

        return $cursor;
    }

    
    public function formatPlain($value, $entry = null)
    {
        $value = $this->prepare($value);

        $label = '';
        if (is_null($value)) {
            return null;
        } else {
            $foreignEntry = Norm::factory($this['foreign'])->findOne(array($this['foreignKey'] => $value,'groups' => $this['groups']));
            $label = $foreignEntry[$this['foreignLabel']];
        }
        return $label;
    }

    public function formatInput($value, $entry = null)
    {
        return $this->render('_schema/sysparam_reference/input', array(
            'self' => $this,
            'value' => $value,
            'entry' => $entry,
        ));
    }


    public function toJSON($value)
    {
        $foreignCollection = Norm::factory($this['foreign']);

        if (Norm::options('include')) {
            $foreignKey = $this['foreignKey'];

            return $foreignCollection->findOne(array($this['foreignKey'] => $value, 'groups' => $this['groups']));
        }

        return $value;
    }


}