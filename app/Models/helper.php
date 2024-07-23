<?php


//Here is the function for getting a unique asorted number
function getUniqueNumbers($array)
{
    return array_values(array_unique($array));
}


function isPalindrome($str)
{
    $cleanedStr = preg_replace("/[^a-zA-Z0-9]/", '', strtolower($str));

    $reversedStr = strrev($cleanedStr);

    return $cleanedStr === $reversedStr;
}
