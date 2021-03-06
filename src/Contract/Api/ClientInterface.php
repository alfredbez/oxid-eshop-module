<?php

namespace Omikron\FactFinder\Oxid\Contract\Api;

use Omikron\FactFinder\Oxid\Exception\ResponseException;

interface ClientInterface
{
    /**
     * Sends HTTP GET request to FACT-Finder. Returns the parsed server response.
     *
     * @param string $endpoint
     * @param array  $params
     *
     * @return array
     * @throws ResponseException
     */
    public function sendRequest(string $endpoint, array $params): array;

    /**
     * Sends HTTP POST request to FACT-Finder. Returns the parsed server response.
     *
     * @param string $endpoint
     * @param array  $params
     *
     * @return array
     * @throws ResponseException
     */
    public function postRequest(string $endpoint, array $params): array;
}
