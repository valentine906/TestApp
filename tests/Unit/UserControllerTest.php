<?php

namespace Tests\Unit;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class UserControllerTest extends TestCase
{
    /**
     * A basic unit test example.
     */
    public function test_example(): void
    {
        // Arrange: Prepare valid input data
        $userData = [
            'name' => 'John Doe',
            'email' => 'john@example.com',
            'password' => 'password123',
        ];


        $response = $this->post('api/users/store', $userData);

        // Assert: Check that the user was created in the database
        $response->assertStatus(201);

        // Check that the user exists in the database, if exist give an error
        $this->assertDatabaseHas('users', [
            'name' => 'John Doe',
            'email' => 'john@example.com',
        ]);

    }


}
