// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract RegistryFogDAO {
    address public originator;

    struct FogSignal {
        string packageName;
        string registrySource;
        string containmentStatus;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    FogSignal[] public fogLedger;

    constructor() {
        originator = msg.sender;
    }

    function logFogSignal(
        string memory packageName,
        string memory registrySource,
        string memory containmentStatus,
        bool isScrollchainSealed
    ) external {
        fogLedger.push(FogSignal({
            packageName: packageName,
            registrySource: registrySource,
            containmentStatus: containmentStatus,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
