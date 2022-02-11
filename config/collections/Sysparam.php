<?php

use Norm\Schema\NormString;
use Norm\Schema\NormInteger;
use Norm\Schema\NormText;

return array(
    'schema' => array(
        'groups' => NormString::create('groups')->filter('trim|required')->set('list-column', true),
        'key' => NormString::create('key', 'Key')->filter('trim|required')->set('list-column', true),
        'value' => NormString::create('value')->filter('trim|required')->set('list-column', true),
        'order_param' => NormInteger::create('order_param')->filter('trim|required')->set('list-column', true),
        'long_value' => NormText::create('long_value')->filter('trim')->set('list-column', true),
    ),
);