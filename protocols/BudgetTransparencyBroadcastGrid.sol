// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BudgetTransparencyBroadcastGrid {
    address public steward;

    struct TransparencyEntry {
        string agencyOrPartylist;
        uint256 budgetAllocated;
        string transparencyStatus; // "Published", "Pending", "Obscured"
        string auditTrailLink;
        string emotionalTag;
        bool broadcasted;
        bool sealed;
    }

    TransparencyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastTransparency(string memory agencyOrPartylist, uint256 budgetAllocated, string memory transparencyStatus, string memory auditTrailLink, string memory emotionalTag) external onlySteward {
        entries.push(TransparencyEntry(agencyOrPartylist, budgetAllocated, transparencyStatus, auditTrailLink, emotionalTag, true, false));
    }

    function sealTransparencyEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getTransparencyEntry(uint256 index) external view returns (TransparencyEntry memory) {
        return entries[index];
    }
}
