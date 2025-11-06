// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TradeSovereigntyRiskCodex {
    address public steward;

    struct RiskClause {
        string wtoMember;
        string safetyConcern;
        string ethicalBreach;
        string geopoliticalSignal;
        string emotionalTag;
    }

    RiskClause[] public codex;

    event TradeSovereigntyTagged(string wtoMember, string safetyConcern, string ethicalBreach, string geopoliticalSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagRisk(
        string memory wtoMember,
        string memory safetyConcern,
        string memory ethicalBreach,
        string memory geopoliticalSignal,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(RiskClause(wtoMember, safetyConcern, ethicalBreach, geopoliticalSignal, emotionalTag));
        emit TradeSovereigntyTagged(wtoMember, safetyConcern, ethicalBreach, geopoliticalSignal, emotionalTag);
    }
}
