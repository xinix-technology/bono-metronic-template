<?php

namespace App\Schema;

use App\Schema\NormString;
use Bono\App;

class InputMask extends NormString{

    public function  __construct($name = null, $label = null)
    {
        parent::__construct($name,$label);
        $this['mask'] ='';
        
    }

    public function set_mask($mask){
        
        $this['mask'] = $mask;

        return $this;
    }

   public function formatInput ($value, $entry = NULL)
    {
        $app = App::getInstance();

        $class = array();

        if(!empty($app->config('bono.theme')['htmlclass'])){
            $class = $app->config('bono.theme')['htmlclass'];
        }

        
        
        if(!empty($this['class'])){
            $class = array_merge($class,$this['class']);
        }

        return $this->render('_schema/input_mask/input', array(
            'value' => $value,
            'entry' => $entry,
            'self' => $this,
            'mask' => $this['mask'],
            'class' => implode($class," "),
        ));
    }

} 


