<?php

namespace App\Schema;

use Norm\Schema\Field;

class MetronicField extends Field
{
    public function label($plain = false)
    {

        $label = l($this['label']);
        if ($plain) {
            return $label;
        }
        return '<label>'.$label.($this['filterRequired'] ? ' <span class="text-danger">*</span>' : '').'</label>';
    }
}