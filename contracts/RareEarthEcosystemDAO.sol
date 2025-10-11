// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract RareEarthEcosystemDAO {
    address public originator;

    struct EcosystemSignal {
        string siteLocation;
        string infrastructureType;
        string policySupport;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    EcosystemSignal[] public ecosystemLedger;

    constructor() {
        originator = msg.sender;
    }

    function logEcosystemSignal(
        string memory siteLocation,
        string memory infrastructureType,
        string memory policySupport,
        bool isScrollchainSealed
    ) external {
        ecosystemLedger.push(EcosystemSignal({
            siteLocation: siteLocation,
            infrastructureType: infrastructureType,
            policySupport: policySupport,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
