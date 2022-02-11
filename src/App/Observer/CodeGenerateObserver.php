<?php
namespace App\Observer;

class CodeGenerateObserver{
protected $ex;
    public function saving($model)
    {
        $model['code']=$this->CodeGenerate($model->getClass());
        // $this->ex = $model['ex'];
        unset($model['ex']);
        // echo '<pre>';
        // print_r($model->toArray());
        // exit;
         
        return $model;
    }
    public function CodeGenerate($param){
        $num_str = sprintf("%06d", mt_rand(1,999999));
         return $param. '-'.$num_str;


    }
}