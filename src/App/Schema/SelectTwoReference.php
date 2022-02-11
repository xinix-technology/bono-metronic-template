<?php

namespace App\Schema;

use Norm\Schema\Reference;
use Norm\Norm;
use Bono\Helper\URL;
use Bono\App;

class SelectTwoReference extends Reference
{


    
    public function formatInput($value, $entry = null)
    {

        $app = App::getInstance();

        $class = array();

        if(!empty($app->config('bono.theme')['htmlclass'])){
            $class = $app->config('bono.theme')['htmlclass'];
        }

        
        if(!empty($this['class'])){
            $class = array_merge($class,$this['class']);
        }


        return $this->render('_schema/select2_reference/input', array(
            'self' => $this,
            'value' => $value,
            'entry' => $entry,
            'class' => implode($class,' '),
        ));
    }
}
