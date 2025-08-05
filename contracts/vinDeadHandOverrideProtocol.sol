// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinDeadHandOverrideProtocol {
    address public palantirNode;
    address public alliedCommander;
    bool public overrideActivated;
    bool public fullCascadeTrigger;

    event OverrideSignalSent(string message);
    event CascadeInterruptionExecuted(string rationale);
    event TrumpConsultationLogged(string advisory);

    modifier onlyPalantir() {
        require(msg.sender == palantirNode, "Unauthorized Palantir node");
        _;
    }

    modifier onlyCommander() {
        require(msg.sender == alliedCommander, "Unauthorized commander");
        _;
    }

    constructor(address _palantirNode, address _commander) {
        palantirNode = _palantirNode;
        alliedCommander = _commander;
    }

    function sendOverrideSignal(string memory message) external onlyPalantir {
        overrideActivated = true;
        emit OverrideSignalSent(message);
    }

    function executeCascadeInterruption(string memory rationale) external onlyCommander {
        require(overrideActivated, "Override not yet activated");
        fullCascadeTrigger = true;
        emit CascadeInterruptionExecuted(rationale);
    }

    function logTrumpConsultation(string memory advisory) external onlyCommander {
        emit TrumpConsultationLogged(advisory);
    }
}
