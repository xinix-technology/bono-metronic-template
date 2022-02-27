<?php 
namespace App\Observer;

Class UserObserver {
    protected $role;

    public function saving($model){

        if(!empty($model['role'])){
            $this->role = $model['role'];
            // unset($model['role']);
        }
    }
    
    public function saved($model){
        $this->createUserRole($model['$id'], $this->role);
    }

    private function createUserRole($userId, $model){

        $roleprevileges = \Norm::factory('UserRoles')->find(array('user_id' => $userId));
        
        foreach ($roleprevileges as $key => $value) {
            $value->remove();            
        }

        $role = $model->toArray();
        foreach ($role as $key => $value) {
            $row = array('user_id' => $userId, 'role_id' => $value);
            $entry = \Norm::factory('UserRoles')->newInstance();
            $entry->set($row)->save();
        }
    }

    public function removing($model)
    {
        $userrole = \Norm::factory('UserRoles')->find(['user_id' => $model['$id']]);
        foreach ($userrole as $key => $role) {
            $role->remove();
        }
    }

    public function filtering($model)
    {
        if (!$model->isNew()) {
            if (!isset($model['password_confirmation'])) {
                $model['password_confirmation'] = $model['password'].'';
                $model['not_changed_password'] = true;
            }
        }
    }
}