<?php

use App\Schema\NormString;
use App\Schema\InputMask;
use App\Schema\Thumbnail;
use App\Schema\FileUpload;
use Norm\Schema\Reference;
use App\Schema\SelectTwoReference;
use App\Schema\MultiReference;
use App\Schema\DatePicker;
use App\Schema\SysparamReference;
use App\Schema\SearchReference;
use Norm\Schema\NormDate;
use Norm\Schema\NormDateTime;
 

return array(
    'schema' => array(
        'photo'   => Thumbnail::create('photo','Gambar')->set('list-column', true)->set('bucket','storage'),
        'nama'   => NormString::create('nama')->set('list-column', true),
        'alamat'      => NormString::create('alamat')->set('list-column', true),
        'ktp'      => InputMask::create('ktp')->set('list-column', true)->set_mask('99-9999-99_99.999'),
        'file2' => FileUpload::create('file2')->set('list-column', true),
        'file' => FileUpload::create('file')->set('list-column', true)->set('bucket','storage1'),
        'dropdown' => Reference::create('dropdown')->to(array('a'=>'testing1','b'=> 'test2')),
        'select' => SelectTwoReference::create('select')->to(array('a'=>'testing1','b'=> 'test2')),
        'role' => MultiReference::create('role')->to('Role'),
        'role2' => MultiReference::create('role2')->to('Role'),
        'user' => SearchReference::create('user')->to('User','first_name')->set('field',array('email','first_name')),
        'user1' => SearchReference::create('user1')->to('User','last_name')->set('field',array('email','last_name')),
        'testdate' => DatePicker::create('testdate')->setformatdate('dd-mm-yyyy'),
        'testdate2' => DatePicker::create('testdate2')->setformatdate('dd/mm/yyyy'),
             
        'sysparam' => SysparamReference::create('sysparam')->setGroups('gender'),
    ),
);