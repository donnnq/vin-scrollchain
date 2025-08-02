// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinPalantirEcho {
    event ThreatForecasted(string domain, bool threatLevel);

    function forecastThreat(string memory domain) public returns (bool) {
        bool threat = keccak256(abi.encodePacked(domain)) != keccak256(abi.encodePacked("peace"));
        emit ThreatForecasted(domain, threat);
        return threat;
    }
}
