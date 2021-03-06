<?php

if (!function_exists('date_quarter')) {
    /**
     * 计算 $month 是属于哪个季度的
     *
     * @param integer $month
     * @return int|null 异常情况，返回 null。正常情况，返回 1-4（代表1-4季度）
     */
    function date_quarter($month)
    {
        $month = (int)$month;
        if ($month <= 0) {
            return null;
        }

        if ($month <= 3) return 1;
        if ($month <= 6) return 2;
        if ($month <= 9) return 3;
        if ($month <= 12) return 4;

        return null;
    }
}


if (! function_exists('value')) {
    /**
     * Return the default value of the given value.
     *
     * @param  mixed  $value
     * @return mixed
     */
    function value($value)
    {
        return $value instanceof Closure ? $value() : $value;
    }
}
