<?php

namespace App\Schema;

use App\Schema\MetronicField;

class NormString extends MetronicField
{
    
    public function formatReadonly($value, $entry = null)
    {
        return "<input class=\"form-control form-control-solid\" readonly=\"readonly\" value=\"".($this->formatPlain($value, $entry) ?: '&nbsp;')."\">";
    }
}
