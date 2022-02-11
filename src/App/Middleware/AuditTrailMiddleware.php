<?php

namespace App\Middleware;

use \Norm\Norm;

class AuditTrailMiddleware extends \Slim\Middleware {

    public function call(){
        $request = $this->app->request;
        $user = array();
        if(!empty($_SESSION['user'])){
            $user = $_SESSION['user'];
        }
        
        
        $data = $this->app->request->getBody();

        $this->next->call();
        
        
        if (!empty($_REQUEST['password'])) {
            unset($data['password']);
        }

        $trail = array(
            'user' => !empty($user['$id']) ? $user['$id']:'',
            'uri' => $request->getPath(),
            'method' => $request->getMethod(),
            'data' => (!empty($data)) ? json_encode($data) : '',
            'ip_address' => $request->getIp(),
            'user_agent' => $request->getUserAgent(),
        );

        $model = Norm::factory('AuditTrail')->newInstance();
        $model->set($trail);
        $model->save();
        
    }


    public function  defaultAudittrail(){

    }

}









