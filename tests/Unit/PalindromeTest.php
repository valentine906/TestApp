<?php

namespace Tests\Unit;

use PHPUnit\Framework\TestCase;

class PalindromeTest extends TestCase
{
    /**
     * A basic unit test example.
     */
    public function testIsPalindrome()
    {
        // Test case 1: Normal palindrome with mixed casing and punctuation
        $input1 = "A man, a plan, a canal, Panama!";
        $this->assertTrue(isPalindrome($input1));

        // Test case 2: Palindrome with different casing
        $input2 = "Racecar";
        $this->assertTrue(isPalindrome($input2));

        // Test case 3: Non-palindrome with special characters
        $input3 = "hello world";
        $this->assertFalse(isPalindrome($input3));

        // Test case 4: Empty string
        $input4 = "";
        $this->assertTrue(isPalindrome($input4)); // Consider an empty string as a palindrome by definition

        // Test case 5: Non-alphanumeric characters only
        $input5 = ".,?!";
        $this->assertTrue(isPalindrome($input5)); // Special case where all non-alphanumeric characters are ignored
    }
}
