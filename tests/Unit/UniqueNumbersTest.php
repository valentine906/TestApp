<?php

namespace Tests\Unit;

use PHPUnit\Framework\TestCase;

class UniqueNumbersTest extends TestCase
{
    /**
     * A basic unit test example.
     */
    public function testGetUniqueNumbers()
    {
        // Test case 1: Normal array with duplicates
        $input1 = [1, 2, 3, 4, 2, 1, 5];
        $expected1 = [1, 2, 3, 4, 5];
        $this->assertEquals($expected1, getUniqueNumbers($input1));

        // Test case 2: Array with all elements already unique
        $input2 = [5, 6, 7, 8, 9];
        $expected2 = [5, 6, 7, 8, 9];
        $this->assertEquals($expected2, getUniqueNumbers($input2));

        // Test case 3: Empty array
        $input3 = [];
        $expected3 = [];
        $this->assertEquals($expected3, getUniqueNumbers($input3));

        // Test case 4: Array with all elements being the same
        $input4 = [2, 2, 2, 2, 2];
        $expected4 = [2];
        $this->assertEquals($expected4, getUniqueNumbers($input4));

        // Test case 5: Array with negative numbers and duplicates
        $input5 = [-1, 2, 4, -1, 2, 5];
        $expected5 = [-1, 2, 4, 5];
        $this->assertEquals($expected5, getUniqueNumbers($input5));
    }
}
