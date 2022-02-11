<?php

namespace App\Schema;

use \Norm\Norm;
use \Bono\Helper\URL;
use \Bono\App;
use \Norm\Schema\NormDate;

class DatePicker extends NormDate
{

    public $date_format = "yyyy-mm-dd";
    public function cell($value, $entry = NULL)
    {
        if ($value instanceof \Norm\Type\DateTime) {
            $result = date($this->date_format, strtotime($value->__toString()));
        } else {
            $result = $value;
        }

        return $result;
    }

    private function convertFormatDate($format){
        $curr = $format;
        $curr = preg_replace("/y{4}/","Y",$curr);
        $curr = preg_replace("/y{2}/","Y",$curr);
        $curr = preg_replace("/d{2}/","d",$curr);
        $curr = preg_replace("/m{2}/","m",$curr);

        return $curr;
    }

    public function setformatdate($format='yyyy-mm-dd'){
        $this->date_format = $format;
        return $this;
    }

    public function formatReadonly($value, $entry = null)
    {
        return '<span class="field">'.($this->formatPlain($value, $entry) ?: '&nbsp;').'</span>';
    }


    public function formatPlain($value, $entry = null)
    {
        if (is_null($value)) {
            return "";
        }
        return date($this->convertFormatDate($this->date_format), strtotime($value->__toString()));
    }

    public function cleanString($string)
    {
       $string = str_replace(' ', '_', $string);
       $string = preg_replace('/[^A-Za-z0-9\-]/', '', $string);

       return preg_replace('/-+/', '-', $string);
    }

    public function formatInput ($value, $entry = NULL)
    {
        $app = App::getInstance();

        if ($value instanceof \Norm\Type\DateTime) {
            $value = date('Y-m-d', strtotime($value->__toString()));
        } else {
            if (!empty($value)) {
                $value =  date('Y-m-d', strtotime($value));
            }
        }

        return $this->render('_schema/date_picker/input', array(
            'value' => $value,
            'entry' => $entry,
            'self' => $this,
            'clean_name' => $this->cleanString($this['name'])
        ));
    }
}
