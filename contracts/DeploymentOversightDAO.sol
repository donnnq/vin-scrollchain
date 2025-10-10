// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DeploymentOversightDAO {
    address public originator;

    struct OversightSignal {
        string modelName;
        string deploymentRegion;
        string trainerAssigned;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    OversightSignal[] public oversightLedger;

    constructor() {
        originator = msg.sender;
    }

    function logOversightSignal(
        string memory modelName,
        string memory deploymentRegion,
        string memory trainerAssigned,
        bool isScrollchainSealed
    ) external {
        oversightLedger.push(OversightSignal({
            modelName: modelName,
            deploymentRegion: deploymentRegion,
            trainerAssigned: trainerAssigned,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
