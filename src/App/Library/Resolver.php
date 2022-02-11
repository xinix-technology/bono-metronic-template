<?php 

namespace App\Library;

use \Bono\App;

class Resolver {

    public static function resolver($config,$path){
        $app    = App::getInstance();
        $path   = $app->config('config.path') . DIRECTORY_SEPARATOR . $path;
        if ($directoryHandler = opendir($path)) {
            while (($fileName = readdir($directoryHandler)) !== false) {
                if (is_file($path . DIRECTORY_SEPARATOR . $fileName)) {
                    $content = require_once $path . DIRECTORY_SEPARATOR . $fileName;
                    if (is_array($content)) {
                        $config  = array_merge_recursive($config, $content);
                    }
                }
            }
            closedir($directoryHandler);
        }

        return $config;
    }

}