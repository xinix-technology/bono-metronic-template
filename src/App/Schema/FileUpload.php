<?php

namespace App\Schema;

use \Norm\Schema\NormObject;
use \Bono\Helper\URL;
use \Bono\App;

class FileUpload extends NormObject{

    public function formatInput($value, $entry = null)
    {

        if(empty($value)){
            $value = array();
        }
        

        if($value instanceof \Norm\Type\NObject){
                $value = $value->toArray();
        }

        

        return $this->render('_schema/file_upload/input', array(
                    'value' => $value,
                    'entry' => $entry,
                    'self' => $this,
                    'url' => \Bono\Helper\URL::site('/metronic/upload_file.json'),
            ));
        
    }

    public function formatPlain($value, $entry = null)
    {
        if(empty($value)){
            return '';
        }

        if($value instanceof \Norm\Type\NObject){
            $value = $value->toArray();
        }
        if(count($value) < 1){
            return '';
        }
        
        return $value['name'];
    }

    public function formatReadonly($value, $entry = null)
    {   
        if($value instanceof \Norm\Type\NObject){
                $value = $value->toArray();
        }

        

        return $this->render('_schema/file_upload/readonly', array(
                    'value' => $value,
                    'entry' => $entry,
                    'self' => $this,
                    'url' => \Bono\Helper\URL::site('/metronic/upload_file.json'),
            ));
    }
}
