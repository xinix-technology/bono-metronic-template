<?php

namespace App\Schema;

use \Norm\Schema\NormObject;
use \Bono\Helper\URL;

class Thumbnail extends NormObject{

    public function formatInput($value, $entry = null)
    {

        if(empty($value)){
            $value = array();
        }
        

        if($value instanceof \Norm\Type\NObject){
                $value = $value->toArray();
        }

        return $this->render('_schema/thumbnail/input', array(
                    'value' => $value,
                    'entry' => $entry,
                    'self' => $this,
                    'url' => \Bono\Helper\URL::site('/metronic/upload_file.json'),
            ));
        
    }

    public function formatPlain($value, $entry = null)
    {
        if (empty($value)) {
            return "<div class='symbol symbol-50 flex-shrink-0'>
                <img src='".URL::base('assets/metronic/media/avatars/blank.png')."'>
            </div>";
        }

        if ($value instanceof \Norm\Type\NObject) {
            $value = $value->toArray();
        }

        if (count($value) < 1) {
            return "<div class='symbol symbol-50 flex-shrink-0'>
                <img src='".URL::base('assets/metronic/media/avatars/blank.png')."'>
            </div>";
        }

        return "<div class='symbol symbol-50 flex-shrink-0'>
            <img src='".URL::base($value['bucket'].'/'.$value['filename'])."' onerror='this.onerror=null;this.src=\"".URL::base('assets/metronic/media/avatars/blank.png')."\";'>
        </div>";
    }

   
    public function formatReadonly($value, $entry = null)
    {   
        $path= "data";
       
        if ($value instanceof \Norm\Type\NObject) {
            $value = $value->toArray();
        }

        if (count($value) <= 0) {

            return "<div class=\"symbol symbol-100px symbol-lg-160px symbol-fixed position-relative\"><img src='".URL::base('assets/metronic/media/avatars/blank.png')."'></div>";
        }

        return "<div class=\"symbol symbol-100px symbol-lg-160px symbol-fixed position-relative\"><img src='".URL::base($value['bucket'].'/'.$value['filename'])."' onerror='this.onerror=null;this.src=\"".URL::base('assets/metronic/media/avatars/blank.png')."\";'></div>";
    }
}
