<?php

use \App\Schema\NormString;
use Norm\Schema\Referece;

return array(
    'schema' => array(
        'module'   => NormString::create('module')->filter('trim|required')->set('list-column', true),
        'submodule' => NormString::create('submodule')->filter('trim|required')->set('list-column', true),
        'ordering' => NormString::create('ordering')->filter('trim|required')->set('list-column', true),
        'action' => NormString::create('action')->filter('trim|required')->set('list-column', true),
        'uri' => NormString::create('uri')->filter('trim|required')->set('list-column', true),
    ),
);