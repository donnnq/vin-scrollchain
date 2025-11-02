// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CrowdFlowOptimizationCodex {
    address public steward;

    struct FlowClause {
        string district;
        string optimizationMethod;
        string civicOutcome;
        string emotionalTag;
    }

    FlowClause[] public codex;

    event CrowdFlowOptimized(string district, string optimizationMethod, string civicOutcome, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function optimizeCrowdFlow(
        string memory district,
        string memory optimizationMethod,
        string memory civicOutcome,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(FlowClause(district, optimizationMethod, civicOutcome, emotionalTag));
        emit CrowdFlowOptimized(district, optimizationMethod, civicOutcome, emotionalTag);
    }
}
