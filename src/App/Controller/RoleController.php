<?php

namespace App\Controller;

use \Norm\Controller\NormController;
use Norm\Norm;

class RoleController extends AppController
{

    public function mapRoute(){
        parent::mapRoute();
        $this->map('/:id/remove/:user_id', 'removeUserFromRole')->via('GET', 'POST');
    }

    public function search()
    {
        $this->data['previlege'] =  $this->generatePrevilegeIndex();
        $criteria = $this->getCriteria();
        $criteria['status'] = '1';
        $entries = $this->collection->find($criteria)
            ->match($this->getMatch())
            ->sort($this->getSort())
            ->skip($this->getSkip())
            ->limit($this->getLimit());
        
        $arr = [];
        foreach ($entries as $key => $entry) {
            $arr[$key] = $entry->toArray();
            $arr[$key]['permissions'] = $this->generatePrevilegeIndex($entry['$id']);
            $arr[$key]['users'] = $this->generateUser($entry['$id'])->count();
        }
        $this->data['entries'] = $arr;
    }

    public function generatePrevilegeIndex($id = null)
    {
        $datarole = array();
        
        $previlegerole = \Norm::factory('RolePrevileges')->find(array('role' => $id));
        foreach ($previlegerole as $key => $value) {
            $role = \Norm::factory('Previleges')->findOne(['uri' => $value['rule']]);
            $datarole[$key] = $value->toArray();
            $datarole[$key]['permissions'] = $role->toArray();
        }
        return $datarole;
    }

    public function generateUser($id = null)
    {

        $userrole = \Norm::factory('UserRoles')->find(array('role_id' => $id));
        
        return $userrole;
    }

	public function create()
    {
        $this->data['previlege'] = $this->generatePrevilege();
        parent::create();
    }

    public function read($id)
    {
        parent::read($id);
        $this->data['permissions'] = $this->generatePrevilegeIndex($id);

        $users = [];
        foreach ($this->generateUser($id) as $key => $value) {
            $user = \Norm::factory('User')->findOne($value['user_id']);
            $users[] = $user;
        }
        
        $this->data['users'] = $users;
    }


    public function update($id)
    {
        parent::update($id);
        $this->data['previlege'] =  $this->generatePrevilege($id);
    }

    public function generatePrevilege($id = null)
    {

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

    public function removeUserFromRole($id, $userId)
    {
        print_r($id);
        print_r($userId);
        exit;
    }

}