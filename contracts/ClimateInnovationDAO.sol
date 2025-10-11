// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ClimateInnovationDAO {
    address public originator;

    struct InnovationSignal {
        string innovationType;
        string deploymentSite;
        string climateApplication;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    InnovationSignal[] public innovationLedger;

    constructor() {
        originator = msg.sender;
    }

    function logInnovationSignal(
        string memory innovationType,
        string memory deploymentSite,
        string memory climateApplication,
        bool isScrollchainSealed
    ) external {
        innovationLedger.push(InnovationSignal({
            innovationType: innovationType,
            deploymentSite: deploymentSite,
            climateApplication: climateApplication,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
