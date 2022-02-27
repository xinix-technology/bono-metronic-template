<?php

namespace App\Provider;

use \Norm\Filter\Filter;
use Norm\Filter\FilterException;

class AppProvider extends \Bono\Provider\Provider
{
    public function initialize()
    {
        $app = $this->app;

        Filter::register('salt_password', function ($key, $value, $data) {
            if ($key == 'password' && !empty($data['not_changed_password']) && !$data->isNew()) {
                unset($data['not_changed_password']);
                return $value;
            }

            $config = \Bono\App::getInstance()->config('bono.salt');

            if (is_string($config)) {
                $config = array(
                    'salt' => $config,
                    'method' => 'md5',
                );
            } else {
                $config['method'] = (isset($config['method'])) ? $config['method'] : 'md5';
            }

            if (empty($config['salt'])) {
                throw new \Exception('You should define config bono.salt in order to use salt.');
            }

            if ($value) {
                $hash = $config['method'];
                return $hash($value.$config['salt']);
            }
        });
    }
}
