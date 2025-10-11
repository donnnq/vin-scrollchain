// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PureRATContainmentProtocol {
    address public originator;

    struct RATSignal {
        string infectedHost;
        bool phishingVectorDetected;
        bool credentialHarvested;
        bool RATDeployed;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    RATSignal[] public ratLedger;

    constructor() {
        originator = msg.sender;
    }

    function logRATSignal(
        string memory infectedHost,
        bool phishingVectorDetected,
        bool credentialHarvested,
        bool RATDeployed,
        bool isScrollchainSealed
    ) external {
        ratLedger.push(RATSignal({
            infectedHost: infectedHost,
            phishingVectorDetected: phishingVectorDetected,
            credentialHarvested: credentialHarvested,
            RATDeployed: RATDeployed,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
