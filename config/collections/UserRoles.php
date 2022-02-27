<?php

use \App\Schema\NormString;
use Norm\Schema\Password;
use Norm\Schema\Reference;

return array(
    'schema' => array(
        'user_id'   => Reference::create('user_id')->to('Users')->filter('trim|required')->set('list-column', true),
        'role_id'   => Reference::create('role')->to('Role')->filter('trim|required')->set('list-column', true),
    ),
);