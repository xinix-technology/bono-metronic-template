<?php 
namespace App\Observer;

Class RoleObserver {

    protected $rule;

    public function saving($model){

        if(!empty($model['rule'])){
            $this->rule = $model['rule'];
            unset($model['rule']);
        }
    }

    public function saved($model){
            $this->createPrevilege($model['$id'],$this->rule);
    }


    private function createPrevilege($idRole, $model){

        $roleprevileges = \Norm::factory('RolePrevileges')->find(array('role'=>$idRole));
        
        foreach ($roleprevileges as $key => $value) {
            $value->remove();            
        }
        

        foreach ($model as $key => $value) {
            $row = array('role' => $idRole,'type' => 'uri' , 'rule' => $value);
            $entry = \Norm::factory('RolePrevileges')->newInstance();
            $entry->set($row)->save();
        }



    }


}