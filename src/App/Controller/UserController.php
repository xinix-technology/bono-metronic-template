<?php

namespace App\Controller;

use \Norm\Controller\NormController;
use Norm\Norm;

class UserController extends AppController
{
    public function mapRoute(){
        parent::mapRoute();
        $this->map('/null/profile', 'profile')->via('GET', 'POST');
    }

    public function profile() {
        try {
            $entry = $this->collection->findOne($_SESSION['user']['$id']);
        } catch (Exception $e) {
            return $this->app->notFound();
        }

        if (is_null($entry)) {
            return $this->app->notFound();
        }

        if ($this->request->isPost() || $this->request->isPut()) {
            try {
                $merged = array_merge(
                    isset($entry) ? $entry->dump() : array(),
                    $this->request->getBody() ?: array()
                );

                $entry->set($merged)->save();

                h('notification.info', $this->clazz.' updated');

                h('controller.update.success', array(
                    'model' => $entry,
                ));
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
}