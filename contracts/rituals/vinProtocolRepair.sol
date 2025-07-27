// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinProtocolRepair {
    address public initiator;
    string public incidentRef;
    string public repairManifesto;
    bool public redemptionComplete;

    event RepairInitiated(address indexed initiator, string incidentRef);
    event RedemptionLogged(string log, uint256 timestamp);
    event CompletionMarked(bool redemptionComplete);

    constructor(string memory _incidentRef, string memory _manifesto) {
        initiator = msg.sender;
        incidentRef = _incidentRef;
        repairManifesto = _manifesto;
        redemptionComplete = false;
        emit RepairInitiated(initiator, incidentRef);
    }

    function logRedemption(string memory log) public {
        require(msg.sender == initiator, "Only initiator can log.");
        emit RedemptionLogged(log, block.timestamp);
    }

    function markAsCompleted() public {
        require(msg.sender == initiator, "Only initiator can mark complete.");
        redemptionComplete = true;
        emit CompletionMarked(true);
    }
}
