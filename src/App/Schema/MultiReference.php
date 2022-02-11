<?php

namespace App\Schema;

use Bono\App;
use Norm\Norm;
use Norm\Schema\ReferenceArray;

class MultiReference extends ReferenceArray
{
    public function formatReadonly($value, $entry = null)
    {
        $html = "<span class=\"form-control form-control-solid\">\n";
        if (!empty($value)) {
            foreach ($value as $key => $v) {
                $foreignEntry = Norm::factory($this['foreign'])->findOne(array($this['foreignKey'] => $v));
                if (is_string($this['foreignLabel'])) {
                    $label = $foreignEntry[$this['foreignLabel']];
                } elseif (is_callable($this['foreignLabel'])) {
                    $getLabel = $this['foreignLabel'];
                    $label = $getLabel($foreignEntry);
                }
                $html .= '<span class="label label-light-success label-inline font-weight-bold">'.$label."</span>\n";
            }
        }
        $html .= "</span>\n";
        return $html;
    }

	public function formatInput($value, $entry = null)
    {
        if(!empty($value)){
            if($value instanceof \Norm\Type\NormArray){
                $value = $value->toArray();
            }
            $datavalue = array();
            foreach ($value as $k => $v) {
                $datavalue[$v]=true;
            }
        }else{
            $datavalue = array();
        }

        return $this->render('_schema/multi_reference/input', array(
            'value' => $datavalue,
            'entry' => $entry,
        ));
    }
}