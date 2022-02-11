<?php

namespace App\Controller;

use \Norm\Controller\NormController;

class AppController extends NormController
{
    public function mapRoute(){
        parent::mapRoute();
        $this->map('/null/export_csv', 'export_csv')->via('GET', 'POST');
        $this->map('/:id/trash', 'trash')->via('GET', 'POST');
    }

    public function getLimitExport(){
        $limit = $this->request->get('!limit');

        return $limit;
    }
  

    public function getSearch(){

        $search = $this->request->get('!search');

        if($search){
            $schema =  $this->collection->schema();
            $dtsearch = array();
            foreach ($schema as $value) {
                if($value->get('name')[0] !='$'){
                    if($value->get('list-column')){
                        $dtsearch[] = array($value->get('name').'!like' => $search);
                    }
                }
            }

            $search = array('!or' => $dtsearch);

        }else{
            $search = array();
        }

        return $search;
    }

    public function getSort(){
        $sort = parent::getSort();
        if(empty($sort)){
            $sort['$created_time'] = -1;
        }
        return $sort;
    }

    public function getCriteria(){
        $criteria = parent::getCriteria();
        
        if (empty($criteria)) {
            $criteria['status'] = '1';
        }

        $criteria = array_merge($criteria,$this->getSearch());

        return $criteria;
    }

    public function export_csv(){

        $entries = $this->collection
                    ->find($this->getCriteria())
                    ->limit($this->getLimitExport())
                    ->skip($this->getSkip())
                    ->sort($this->getSort());

        $schema = $this->collection->schema();
        $field = $this->generateField($schema);
        $f = fopen('php://memory', 'w'); 

        fputcsv($f,array_values($field),',');
        
        foreach ($entries as $key => $value) {
            fputcsv($f,$this->generateRow($value,$field),',');
        }

        fseek($f, 0);

        header('Content-Type: application/csv');
        // tell the browser we want to save it instead of displaying it
        header('Content-Disposition: attachment; filename="'.$this->clazz.'.csv";');
        fpassthru($f);

        exit();
        

    }

    private function generateField($schema){

        $field = array();

        foreach ($schema as $key => $value) {
            if ($value['list-column']) {
                $field[$key]=str_replace('$','',str_replace('*','',$value->label(true)));
            }
        }

        return $field;
    }

    private function generateRow($model,$field){
        $row = array();
        foreach ($field as $name => $value) {
            try{
                if($model->format($name) instanceof \Norm\Type\DateTime){
                    $row[] = date('Y-m-d H:i:s' ,strtotime($model->format($name)->__toString()));
                    continue;
                }
                $row[] = $model->format($name);
            }catch(\Exception $e){
                $row[] ='';
            }
        }
        return $row;
    }

    public function search()
    {
        $criteria = $this->getCriteria();
        $sort = $this->getSort();
        $criteria['status'] = '1';

        $entries = $this->collection->find($criteria)
            ->match($this->getMatch())
            ->sort($sort)
            ->skip($this->getSkip())
            ->limit($this->getLimit());
        
        $this->data['entries'] = $entries;
    }

    public function create()
    {
        $entry = $this->collection->newInstance()->set($this->getCriteria());

        $this->data['entry'] = $entry;

        if ($this->request->isPost()) {
            try {
                $body = $this->request->getBody();
                $body['status'] = '1';
                
                $result = $entry->set($body)->save();

                h('notification.info', $this->clazz.' created.');

                h('controller.create.success', array(
                    'model' => $entry
                ));
            } catch (Stop $e) {
                throw $e;
            } catch (Exception $e) {
                h('controller.create.error', array(
                    'model' => $entry,
                    'error' => $e,
                ));

                // rethrow error to make sure notificationmiddleware know what todo
                throw $e;
            }
        }
    }

    public function trash($id)
    {
        try {
            $entry = $this->collection->findOne($id);
        } catch (Exception $e) {
            // noop
        }

        if (is_null($entry)) {
            return $this->app->notFound();
        }

        if ($this->request->isPost() || $this->request->isPut()) {
            try {
                $now = new \DateTime();
                $entry->set(['status' => '0'])->save(['filter' => false]);

                h('notification.info', $this->clazz.' deleted.');

                if (preg_match('/\/.*\.json/', $this->request->getPathInfo())) {
                    h('controller.update.success', array(
                        'model' => $entry,
                    ));
                } else {
                    h('controller.delete.success', array(
                        'model' => $entry,
                    ));
                }
            } catch (Stop $e) {
                throw $e;
            } catch (Exception $e) {
                h('notification.error', $e);

                if (empty($entry)) {
                    $model = null;
                }

                h('controller.update.error', array(
                    'error' => $e,
                    'model' => $entry,
                ));
            }
        }

        $this->data['entry'] = $entry;
    }

    public function rowsArray($sql, $params = array())
    {
        $connection = \Norm::getConnection('mysql')->getRaw();
        $statement = $connection->prepare($sql);

        if (empty($params)) {
            $statement->execute();
        } else {
            $statement->execute($params);
        }

        $results = $statement->fetchAll(\PDO::FETCH_ASSOC);

        return $results;
    }
    
}
