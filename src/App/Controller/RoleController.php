<?php

namespace App\Controller;

use \Norm\Controller\NormController;
use Norm\Norm;

class RoleController extends AppController
{


	public function create()
    {
        $this->data['previlege'] = $this->generatePrevilege();
        parent::create();
    }


    public function update($id)
    {
        parent::update($id);
        $this->data['previlege'] =  $this->generatePrevilege($id);
    }

    

    public function generatePrevilege($id = null){

        $previlege =  \Norm::factory('Previleges')->find()->sort(array('ordering' => 1));
        $prearray = array();

        if($id){
            $previlegerole = \Norm::factory('RolePrevileges')->find(array('role' => $id));
            $datarole = array();
            foreach ($previlegerole as $key => $value) {
                $datarole[$value['rule']] = true;
            }
            
        }

        foreach ($previlege as $key => $value) {
            if(empty($prearray[$value['module']])){
                $prearray[$value['module']] = array();
            }else{
                if(empty($prearray[$value['module']][$value['submodule']])){
                    $prearray[$value['module']][$value['submodule']] = array();
                }
            }
            if(!empty($datarole[$value['uri']])){
                $prearray[$value['module']][$value['submodule']][$value['action']] = array("uri" => $value['uri'] , "exists" => true);    
            }else{
                $prearray[$value['module']][$value['submodule']][$value['action']] = array("uri" => $value['uri'] , "exists" => false);    
            }
            
        }

        return  $prearray;

    }

}