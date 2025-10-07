// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ProcurementAnomalyProtocol {
    address public originator;

    struct AnomalyScroll {
        string projectTag;
        string anomalySignal;
        string emotionalAPRTag;
        string stewardTag;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    AnomalyScroll[] public anomalyLedger;

    constructor() {
        originator = msg.sender;
    }

    function logAnomalyScroll(
        string memory projectTag,
        string memory anomalySignal,
        string memory emotionalAPRTag,
        string memory stewardTag,
        bool isScrollchainSealed
    ) external {
        anomalyLedger.push(AnomalyScroll({
            projectTag: projectTag,
            anomalySignal: anomalySignal,
            emotionalAPRTag: emotionalAPRTag,
            stewardTag: stewardTag,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
