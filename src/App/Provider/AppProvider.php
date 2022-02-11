<?php

namespace App\Provider;

use \Norm\Filter\Filter;
use Norm\Filter\FilterException;

class AppProvider extends \Bono\Provider\Provider
{
    public function initialize()
    {
        $app = $this->app;

        Filter::register('unik', function ($key, $value, $model) {
            $search = array('name' => $model['name'], 'slug' => $model['slug']);

            $check = \Norm::factory($model->getClass())->findOne($search);

            if ($check) {
                throw new FilterException("data'" . $key . "'sudah ada");
            }
            return $value;
        });

        $app->post('/testing', function () use ($app) {
            $post = $app->request->post(); // $_POST


            if ($post) {
                // var_dump
                $entry = \Norm::factory('SecondTest')->newInstance();
                $entry->set('status', 1);
                $entry->set('first_name', $post['first_name']);
                $entry->set('last_name', $post['last_name']);
                $entry->set('alamat', $post['alamat']);
                $entry->save();
                //($post)
                // ;exit;
            }
        });

        $app->get('/testing', function () use ($app) {

            $get = $app->request->get(); // $_GET

            $entry = \Norm::factory('Countries')->find();
            

            // $tampungNegara = [];
            $newData = array();
            foreach ($entry as $key => $value) {
                echo '<pre>';
                print_r($value->toArray());
               
                $entrys = \Norm::factory('Provinces')->find(array('country_id' => $value['$id']));
                foreach ($entrys as $key1 => $value2) {
                    $districs = \Norm::factory('Districs')->find(array('province_id' => $value2['$id']));
                    $newData[$value['name']][$value2['name']] = array();
                    foreach ($districs as $key3 => $value3) {
                        $newData[$value['name']][$value2['name']][$key3] = $value3['name'];
                    }
                }
            } exit;
           
            // echo '<pre>';
            // print_r($newData);
            // exit;

            // }
            //     // $newData[$value['name']][$value2['name']]= array();
            // }



            // $newDataProvince = array();
            // foreach ($entrys as $key2 => $value2) {
            //     $newDataProvince[] = $value2->toArray();
            //     $districs = \Norm::factory('Districs')->find(array(
            //         'province_id' => $value2['$id'],

            //     ));
            //     $newDataProvince[$key2]["districs"] = $districs;
            // }
            // $newData[$key]["province"] = $newDataProvince;
            // echo "<pre>";
            // print_r($value->toArray());

            // 
            // $tampungNegara =  $value["name"];



            // for ($i = 0; $i < count($newData); $i++) {
            //     $gabung = [];
            //     foreach ($newData as $key => $value) {

            //         // $gabung [$va]
            //         echo "<pre>";
            //         print_r($value);
            //         for ($i=0;$i<co)



            //         // echo "<pre>";
            //         // // print_r($value['name']);
            //         // print_r($value['province']);




            //     }
            // echo "<pre>";
            // print_r($value['name']);
            //     print_r($gabung);


            //     exit;
            // }


            // echo "<pre>";
            // print_r($newData);




            // exit;

            // $entry = \Norm::factory('Provinces')->find()
            // $tampungProvince = [];
            // foreach ($entry as $key => $value) {
            //     $tampungProvince =  $value["name"];
            //     echo "<pre>";
            //     print_r($tampungProvince);
            // };
            // exit;

            // $entry = \Norm::factory('Districs')->find();
            // echo "<pre>";
            //     print_r($entry);exit;

            // $tampungProvince =[];
            // foreach ($entry as $key => $value) {
            //     $tampungProvince=  $value["name"];

            //     echo "<pre>";
            //     print_r($tampungProvince);
            // };
            // exit;


            // echo "</pre>";
            // print_r($get);exit;

            // $search=[];

            // foreach ($get as $key =>$value){
            //     if (!empty($value)){
            //         $search [$key]=$value;


            //     }
            // }
            // echo "<pre>";
            // print_r($get);exit;
            // foreach ($get as $key => $value) {
            // }
            // if (isset($get["first_name"])) {
            //     // or
            //     // $entry = \Norm::factory('SecondTest')->find(array(
            //     //     "!or" => array(
            //     //         array("first_name!like" => $get["first_name"]),
            //     //         array("last_name!like" => $get["last_name"]),
            //     //         array("alamat!like" => $get["alamat"]),
            //     //     )

            //     // ));

            //     //   and
            //     $entry = \Norm::factory('SecondTest')->find(array(
            //         'first_name!like' => $get['first_name'],
            //         'last_name!like' => $get['last_name'],
            //         'alamat!like' => $get['alamat'],

            //     ));
            //     // echo "<pre>";
            //     // print_r($entry->toArray());
            //     // exit;
            // } else {
            //     // var_dump($_POST);exit;

            // }
            // $entry = \Norm::factory('SecondTest')->find($search);


            //         echo "<pre>";
            // print_r($criteria);exit;

            // // echo "<pre>";],
            //         'last_name!like' => $get['last_name'],
            //         'alamat!like' => $get['alamat'],

            //     ));
            // echo "<pre>";
            // print_r($entry->toArray());
            //     print_r($entry);exit;


            // foreach ($entry as $key=> $value){


            //     echo "<pre>";
            //     print_r($value->toArray())     ;        
            //     // ;

            // //     echo "<pre>";
            // // print_r();exit;


            // // echo "<pre>";
            // // print_r($value->toArray()) ;            
            // }
            // exit;
            // }          ;exit;
            // echo "<pre>";
            // print_r($value->toArray())             
            // ;exit;

            // var_dump($entry);exit;

            // $second=array(1,2,3,4);
            // echo "<pre>";
            // print_r($second);
            // exit;
            $data = array(

                "1" => array(
                    "sample1", "L", "Testing1", "812344"
                ),
                "2" => array(
                    "sample2", "P", "Testing2", "812344"
                ),
                "3" => array(
                    "sample3", "L", "Testing3", "812344"
                ),
                "4" => array(
                    "sample4", "p", "Testing4", "812344"
                ),
                "5" => array(
                    "sample5", "L", "Testing5", "812344"
                ),
                "6" => array(
                    "sample6", "P", "Testing6", "812344"
                ),
                "7" => array(
                    "sample5", "L", "Testing7", "812344"
                ),
                "8" => array(
                    "sample5", "P", "Testing8", "812344"
                ),
                "9" => array(
                    "sample5", "L", "Testing9", "812344"
                ),
                "10" => array(
                    "sample5", "P", "Testing10", "812344"
                ),




                // "nama"=>"sample",
                // "nama" => array
                // ("sample1", "sample2", "sample3", "sample4", "sample5", "sample6", "sample7", "sample8", "sample9", "sample10"),
                // "gender" => array("L", "P"),
                // "alamat"=>"Testing",
                // "alamat" => array
                // ("Testing1", "Testing2", "Testing3", "Testing4", "Testing5", "Testing6", "Testing7", "Testing8", "Testing9", "Testing10"),
                // "tel" => "812344"
                // 
            );
            // foreach ($data as $key=>$value)

            //  echo "<pre>";
            //     print_r($data);
            //     exit;  echo "<pre>";
            // print_r($get);exit;

            $app->response->data('coba', $newData);

            $app->response->template('second_test/second');
        });
    }
    //         Filter::register('uniq', function($key, $value, $model){
    // $cek=\Norm::factory($model->getClass())->findOne(array($key=>$value));
    // if($cek){
    //     throw new FilterException(("Sorry data '".$key."' is already exist"));
    // }
    // return $value;
    // });
    // public function saving($model)
    // {
    // //    echo "<pre>";
    // //    print_r($model);
    //     return $model;

    // }
    // public function saved($model)
    // {
    //     if ($model['status'] == 1 ) {
    //         $this->saveTable($model);
    //     }
    // }
    // public function saveTable($data)
    // {
    //     // $entry = \Norm::factory('TestObs')->newInstance();
    //     // $entry->set('id_test', $data['$id']);
    //     // $entry->set('first_name', $data['first_name']);
    //     // $entry->set('last_name', $data['last_name']);
    //     // $entry->save();
    // }
}
