<?php

namespace App\Provider;

class LoginProvider extends \Bono\Provider\Provider
{
    public function initialize()
    {
        $app = $this->app;
        $that = $this;

        $app->filter('auth.login.success', function ($user) use ($app) {
            $roles = $user['role'];
            $auth_uris = array();
            foreach ($roles as $key => $role) {
                $roleModel = \Norm::factory('Role')->findOne($role);
                $roleprevileges = \Norm::factory('RolePrevileges')->find(array('role'=>$role));
                $uridata = array();
                foreach ($roleprevileges as $key => $value) {
                    $uridata[] = $value['rule'];
                }
                $uris[] = $uridata;
                $role_names[] = $roleModel['name'];
            }

            
            foreach ($uris as $key => $value) {
                $auth_uris = array_merge($auth_uris, $value);
            }

            
            $user['roles_name'] = $role_names;
            $user['auth_uris'] = $auth_uris;

            $_SESSION['user'] = $user;
            
            return $user;
        });

        /* Check Access Each Role */

        $app->filter('auth.authorize', function ($options) use ($app) {
            if (is_bool($options)) {
                return $options;
            }


            if(preg_match('/\/.*\.json/', $app->request->getPathInfo())){
                if(!empty($_SESSION['user'])){
                    return true;
                }
            }

            $user = isset($_SESSION['user']) ? $_SESSION['user'] : null;
            // echo("<pre>");
            // print_r($user);
            // exit;
            if (!is_null($user)) {

                /* Allow user to access homepage */
                if (empty($options['uri'])) {
                    return true;
                }

                $uri = is_string($options)?$options:$options['uri'];
                $segment = explode('/', $uri);


                /* Allow this user for access all authorized uri */
                $auth_uris = $user['auth_uris'];

                foreach ($auth_uris as $auth_uri) {
                    /* Allow admin for access all URI */
                    if ($auth_uri == '*') {
                        return true;
                    }

                    // $auth_uri =  str_replace(':id', '[a-zA-Z0-9\.\:]+', $auth_uri);
                    $auth_uri =  str_replace('/', '\/', $auth_uri);
                    $auth_uri = "@^" . preg_replace('/(:id)+/', '([a-zA-Z0-9\-\_\.\?\:]+)', $auth_uri) . "$@D";

                    if (preg_match($auth_uri, $options['uri'])) {
                        return true;
                    }
                }

                return false;
            }

            return $options;
        });
    }
}
