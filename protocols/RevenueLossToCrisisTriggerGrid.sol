// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RevenueLossToCrisisTriggerGrid {
    address public steward;

    struct LossEntry {
        string proposal; // "VAT cut to 10%"
        string projectedLoss; // "₱330 billion"
        string impactSignal; // "Fiscal deficit", "Credit downgrade", "Service disruption"
        string emotionalTag;
        bool triggered;
        bool sealed;
    }

    LossEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function triggerLoss(string memory proposal, string memory projectedLoss, string memory impactSignal, string memory emotionalTag) external onlySteward {
        entries.push(LossEntry(proposal, projectedLoss, impactSignal, emotionalTag, true, false));
    }

    function sealLossEntry(uint256 index) external onlySteward {
        require(entries[index].triggered, "Must be triggered first");
        entries[index].sealed = true;
    }

    function getLossEntry(uint256 index) external view returns (LossEntry memory) {
        return entries[index];
    }
}
