// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinShadowDiplomancer {
    string public overseer = "vinvin the Strategist";
    string public targetEntity = "VP Sara Duterte";
    string public purpose = "Decode diplomatic intent, symbolic gestures, and foreign alliance flows";

    struct DiplomaticSignal {
        string actor;
        string originNation;
        string gestureType;
        string intent;
        uint256 timestamp;
    }

    DiplomaticSignal[] public shadowLog;

    mapping(address => bool) public scrollAnalysts;
    address public diplomancerCore;

    modifier onlyCore() {
        require(msg.sender == diplomancerCore, "Unauthorized diplomancer");
        _;
    }

    constructor() {
        diplomancerCore = msg.sender;
        scrollAnalysts[msg.sender] = true;
    }

    function recordSignal(
        string memory actor,
        string memory originNation,
        string memory gestureType,
        string memory intent
    ) public {
        require(scrollAnalysts[msg.sender], "Analyst access required");
        shadowLog.push(DiplomaticSignal(actor, originNation, gestureType, intent, block.timestamp));
    }

    function authorizeAnalyst(address analyst) public onlyCore {
        scrollAnalysts[analyst] = true;
    }

    function viewSignal(uint index) public view returns (
        string memory actor,
        string memory originNation,
        string memory gestureType,
        string memory intent,
        uint256 timestamp
    ) {
        DiplomaticSignal storage signal = shadowLog[index];
        return (signal.actor, signal.originNation, signal.gestureType, signal.intent, signal.timestamp);
    }
}
