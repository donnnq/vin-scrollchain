// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodexToCryptoVolatilityResilienceProtocol {
    string public batchID = "1321.9.92";
    string public steward = "Vinvin";

    struct Resilience {
        string asset;
        bool activated;
        string strategy;
    }

    mapping(string => Resilience) public resilienceRegistry;

    function activateResilience(
        string memory asset,
        string memory strategy
    ) public {
        resilienceRegistry[asset] = Resilience(asset, true, strategy);
    }

    function getStrategy(string memory asset) public view returns (string memory) {
        return resilienceRegistry[asset].strategy;
    }
}
