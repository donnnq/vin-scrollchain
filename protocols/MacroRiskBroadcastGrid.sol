// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MacroRiskBroadcastGrid {
    address public steward;

    struct RiskSignal {
        string signalID;
        string corridor;
        string riskType;
        string emotionalTag;
    }

    RiskSignal[] public grid;

    event RiskBroadcasted(string signalID, string corridor, string riskType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function broadcastRisk(
        string memory signalID,
        string memory corridor,
        string memory riskType,
        string memory emotionalTag
    ) public onlySteward {
        grid.push(RiskSignal(signalID, corridor, riskType, emotionalTag));
        emit RiskBroadcasted(signalID, corridor, riskType, emotionalTag);
    }
}
