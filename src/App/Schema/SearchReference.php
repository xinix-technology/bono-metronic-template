<?php

namespace App\Schema;

use Norm\Schema\Reference;
use Bono\App;

class SearchReference extends Reference{

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

        $custom = false;
        if($this['field']){
                $custom =true;
        }
        
        $data = array();
        $foreign = \Norm::factory($this['foreign'])->schema();
        $collection = \Norm::factory($this['foreign'])->findOne(array($this['foreignKey'] => $value));

        foreach ($foreign as $key => $field) {
            if(!$custom){
                if($field['list-column']){
                    $data[$key] = $field->label(true);
                }    
            }else{
                if(in_array($key,$this['field'])){  
                    $data[$key] = $field->label(true);
                }
            }
            
        }
        
        $this['field'] = $data;

        return $this->render('_schema/search_reference/input', array(
            'value' => $value,
            'label' => $collection[$this['foreignLabel']],
            'entry' => $entry,
            'self' => $this,
            'class' => implode($class," "),
        ));
    }

} 


