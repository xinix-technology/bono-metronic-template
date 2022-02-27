<?php

/**
 * Bono App Configuration
 *
 * @category  PHP_Framework
 * @package   Bono
 * @author    Ganesha <reekoheek@gmail.com>
 * @copyright 2013 PT Sagara Xinix Solusitama
 * @license   https://raw.github.com/xinix-technology/bono/master/LICENSE MIT
 * @version   0.10.0
 * @link      http://xinix.co.id/products/bono
 */

use App\Library\Resolver;

return array(
    'application' => array(
        'title' => 'Bono Metronic',
        'subtitle' => 'Bono framework with metronic theme'
    ),
    'bono.timezone' => 'Asia/Jakarta',
    'bono.prettifyURL' => false,
    'bono.debug' => true,
    'bono.salt' => '123456789',
    'bono.theme' => array(
        'class' => 'Xinix\\Theme\\MetronicTheme',
        'overwrite' => true,
        'htmlclass' => array('form-control'),
        'dark' => true
    ),
    'bono.providers' => array(
        'Norm\\Provider\\NormProvider' => array(
            'datasources' => array(

                // to use mysql
                'mysql' => array(
                    'driver'   => '\\Norm\\Connection\\PDOConnection',
                    'dialect'  => '\\Norm\\Dialect\\MySQLDialect',
                    'prefix'   => 'mysql',
                    'dbname'   => 'bono',
                    'host'     => 'localhost',
                    'username' => 'root',
                    'password' => 'password'
                )
            ),
            'collections' => array(
                'default' => array(
                    // The observer, more like a hook event
                    'observers' => array(
                        'Norm\\Observer\\Ownership',
                        'Norm\\Observer\\Timestampable'
                    ),

                    // Limit the entries that shown, then paginate them
                    'limit' => 10,
                ),

                // Resolver to find where the schemas config stored see in /config/collections folder
                'resolvers' => array(
                    'Norm\\Resolver\\CollectionResolver',
                ),
            ),
        ),
        'Bono\\Provider\\LanguageProvider' => null,
        'App\\Provider\\AppProvider'=> null,
        'App\\Provider\\MetronicProvider'=>array(
            'Upload_Directory' => dirname(__DIR__).'/www',// set directory for upload on application
            'bucket' => 'data'
        ),
        // uncomment below to enable auth
        'App\\Provider\\LoginProvider',
    ),
    'bono.middlewares' => array(

        'Bono\\Middleware\\StaticPageMiddleware' => null,
        'Bono\\Middleware\\ControllerMiddleware' => array(
            'default' => 'App\\Controller\\AppController',
            'mapping' => array(
                '/test' => null,
                '/user' => null,
                '/previleges' => null,
                '/role' => '\\App\Controller\\RoleController',
                '/sysparam' => null,
                
            ),
        ),
        // uncomment below to enable auth
        'Xinix\\BonoAuth\\Middleware\\AuthMiddleware' => array(
            'driver' => 'Xinix\\BonoAuth\\Driver\\NormAuth',
        ),
        'App\\Middleware\\MetronicNotificationMiddleware' => null,
        // 'App\\Middleware\\AuditTrailMiddleware' => null,
        'Bono\\Middleware\\SessionMiddleware' => null,

        'Bono\\Middleware\\ContentNegotiatorMiddleware' => array(
            'extensions' => array(
                'json' => 'application/json',
            ),
            'views' => array(
                'application/json' => 'Bono\\View\\JsonView',
            ),
        ),

    ),
    'custom.bono.base.path' => dirname(__DIR__) . '/www'
);
