<?php

it('returns a successful response', function () {
    $response = $this->get('api/users');

    $response->assertStatus(200);
});
