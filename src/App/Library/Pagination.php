<?php

namespace App\Library;

use Bono\App;
use Bono\Helper\URL;
use Norm\Cursor;

class Pagination
{
    /**
     * Static instance, you can create class via static method
     *
     * @var Libary\Pagination
     */
    protected static $instances = null;

    /**
     * Application context
     *
     * @var Bono\App
     */
    protected $app              = null;

    /**
     * Current page
     *
     * @var int
     */
    protected $current          = null;

    /**
     * Entries
     * @var Norm\Cursor
     */
    protected $entries          = null;

    /**
     * Limit of each collection that shown in a page
     *
     * @var int
     */
    protected $limit            = null;

    /**
     * Base URL that we use for paging
     *
     * @var string
     */
    protected $baseUrl = '';

    protected $querystring='';

    /**
     * Constructor
     *
     * @param Norm\Cursor $entries Entries that we want to page
     */
    public function __construct(Cursor $entries)
    {
        $this->entries = $entries;
        $this->app     = App::getInstance();
        $configCollection = $this->app->config('bono.providers')['Norm\\Provider\\NormProvider']['collections'];
        
        if ($this->app->request->get('!limit')) {
            $this->limit = $this->app->request->get('!limit');
        } else {
            if (isset($configCollection['default'])) {
                if (isset($configCollection['default']['limit'])) {
                    $this->limit = $configCollection['default']['limit'];
                }
            }
        }


        if(!empty($_GET)){
            $get = $this->app->request->get();
            $sort = $this->app->request->get('!sort')?:array();
            $or = $this->app->request->get('!or')?:array();

            $search = array();
            foreach ($get as $key => $value) {
                if($key != '!skip' && $key != '!sort'  && $key != '!or'){
                    if(is_array($value)){
                        foreach ($value as $k => $v) {
                            $search[] = $key . '[]=' . $v;
                        }
                        continue;

                    }
                    $search[] = $key . '=' . $value;
                }
            }

            $or_array = array();
            foreach ($or as $key => $value) {
                if(is_array($value)){
                    foreach ($value as $k => $v) {
                        $or_array[]  = '!or['.$key.'][]='.$v;
                    }
                    continue;
                }
                $or_array[] = '!or['.$key.']='.$value;
            }

            $sort_array = array();
            foreach ($sort as $key => $value) {
                $sort_array[] = '!sort['.$key.']='.$value;
            }


            $this->baseUrl = URL::current() .'?'. implode("&",$search).implode("&",$sort_array).implode("&",$or_array);
        }else{
            $this->baseUrl = URL::current() . '?';
        }

    }

    /**
     * Create new instance of Library\Pagination via static method
     *
     * @param Norm\Cursor $entries Entries that we want to page
     *
     * @return Library\Pagination New instance of Pagination class
     */
    public static function create(Cursor $entries)
    {
        $Class = get_called_class();

        if (is_null(static::$instances[$Class])) {
            static::$instances = new $Class($entries);
        }

        return static::$instances;
    }

    /**
     * Set out base URL
     *
     * @param [type] $url [description]
     */
    public function setBaseUrl($url)
    {
        $this->baseUrl = $url;

        return $this;
    }

    /**
     * Paginate the entries into snipped collection
     *
     * @return string The HTML String that appended to our template
     */
    public function paginate()
    {   
        $limit = $this->limit;


        if (is_null($limit)) {
            return;
        }

        $all     = $this->entries->count();
        $total = ceil($all / $limit);

        $skip    = $this->app->request->get('!skip');
        $this->current = floor($skip / $limit);

        $paging = '';

        if ($total == 1) {
            // kena disini
            // return;
            return  $this->wrapPagination($paging);
        } else {

            if ($total - 1 <= 10) {
                $page_type = "normal";
            } else {

                if ($this->current  < 7) {
                    $page_type = "left";
                } else {
                    if ($total - $this->current <= 7) {
                        $page_type = "right";
                    } else {
                        $page_type = "midle";
                    }
                }
            }

        }

        $paging = $paging. $this->firstPage();
        $paging = $paging. $this->prevPage();

        if ($page_type == "normal") {
             for ($i = 0; $i < $total; $i++) {
                $isCurrent       = ($skip == ($i*$limit));
                $paging = $paging. $this->page($i, $isCurrent);
            }
        } elseif ($page_type == "left") {
            $last = 5;
            if($this->current + 3 > $last){
                $last = $this->current + 3;
            }

            for ($i = 0; $i < $last; $i++) {
                $isCurrent       = ($skip == ($i*$limit));
                $paging = $paging. $this->page($i, $isCurrent);
            }
            $paging = $paging . '<a href="#" class="btn btn-icon btn-sm border-0 btn-light mr-2 my-1">...</a>';

            $last = 3;
            for ($i = $total - $last ; $i < $total; $i++) {
                $paging = $paging. $this->page($i, false);
            }
        } elseif ($page_type == "right") {

            $last = 3;

            for ($i = 0; $i < $last; $i++) {
                $paging = $paging. $this->page($i, false);
            }

            $paging = $paging . '<a href="#" class="btn btn-icon btn-sm border-0 btn-light mr-2 my-1">...</a>';

            $last = 5;

            if(($total - $this->current) + 3 > $last){
                $last = ($total - $this->current) + 2;
            }

            for ($i = $total-$last ; $i < $total; $i++) {
                $isCurrent       = ($skip == ($i*$limit));
                $paging = $paging. $this->page($i, $isCurrent);
            }

        } else {
            $last = 3;

            for ($i = 0; $i < $last; $i++) {
                $paging = $paging. $this->page($i, false);
            }


            $paging = $paging . '<a href="#" class="btn btn-icon btn-sm border-0 btn-light mr-2 my-1">...</a>';
            $last=$this->current + 2;
            for ($i = $this->current - 2 ; $i < $last+1; $i++) {
                $isCurrent       = ($skip == ($i*$limit));
                $paging = $paging. $this->page($i, $isCurrent);
            }

            $paging = $paging . '<a href="#" class="btn btn-icon btn-sm border-0 btn-light mr-2 my-1">...</a>';

            $last = 3;

            for ($i = $total - $last ; $i < $total; $i++) {
                $paging = $paging. $this->page($i, false);
            }

        }


        $paging = $paging. $this->nextPage();
        $paging = $paging. $this->lastPage();

        return  $this->wrapPagination($paging);
    }

    private function lastPage()
    {
        $all     = $this->entries->count();
        $average = floor($all / $this->limit);
        if($this->current == $average) return '';
        $skip = $average * $this->limit;
        return '<a href="'.$this->baseUrl.'&!skip='.$skip.'" class="btn btn-icon btn-sm btn-light mr-2 my-1">
            <i class="ki ki-bold-double-arrow-next icon-xs"></i>
        </a>';
    }

    private function nextPage() {
        $all     = $this->entries->count();
        $average = floor($all / $this->limit);
        if($this->current == $average) return '';
        $skip = $this->limit * ($this->current + 1);
        return '<a href="'.$this->baseUrl.'&!skip='.$skip.'" class="btn btn-icon btn-sm btn-light mr-2 my-1">
            <i class="ki ki-bold-arrow-next icon-xs"></i>
        </a>';
    }

    private function page($page, $isCurrent = false) {
        $skip = $this->limit * ($page);
        if($isCurrent) {
            return '
            <a href="'.$this->baseUrl.'&!skip='.$skip.'" class="btn btn-icon btn-sm border-0 btn-light btn-hover-primary active mr-2 my-1">'.($page + 1).'</a>';
        } else {
            return '<a href="'.$this->baseUrl.'&!skip='.$skip.'" class="btn btn-icon btn-sm border-0 btn-light mr-2 my-1">'.($page + 1).'</a>';
        }
    }

    private function firstPage()
    {
        if($this->current == 0) return '';
        return '<a href="'.$this->baseUrl.'" class="btn btn-icon btn-sm btn-light mr-2 my-1">
            <i class="ki ki-bold-double-arrow-back icon-xs"></i>
        </a>';
    }

    private function prevPage()
    {
        if($this->current == 0) return '';
        $skip = $this->limit * ($this->current - 1);
        return '<a href="'.$this->baseUrl.'&!skip='.$skip.'" class="btn btn-icon btn-sm btn-light mr-2 my-1">
            <i class="ki ki-bold-arrow-back icon-xs"></i>
        </a>';
    }

    private function wrapPagination($html)
    {
        $limit = $this->limit;
        if ($this->app->request->get('!limit')) {
            $limit = $this->app->request->get('!limit');
        }

        $to = floor($this->app->request->get('!skip') + $limit);

        if ($to > $this->entries->count()) {
            $to = $this->entries->count();
        }

        return '
        <div class="d-block d-md-flex justify-content-between">
            <div class="d-flex align-items-center py-2 ml-3">
                <select class="form-control selectpicker datatable-pager-size" title="Select page size" data-width="60px" data-container="body" data-selected="10" style="width:80px">
                    <option value="10">10</option>
                    <option value="20">20</option>
                    <option value="30">30</option>
                    <option value="50">50</option>
                    <option value="100">100</option>
                </select>
                <span class="datatable-pager-detail ml-5 text-grey">Showing '. floor($this->app->request->get('!skip') + 1) .' - '. $to .' of '. $this->entries->count() .'</span>
            </div>
            <div class="d-flex flex-wrap py-2 mr-3">'. $html . '</div>
        </div>';
    }
}
