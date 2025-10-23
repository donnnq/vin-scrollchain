// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PartylistAllocationOversightProtocol {
    address public steward;

    struct OversightEntry {
        string partylistName;
        uint256 budgetAllocated;
        string transparencyStatus; // "Published", "Pending", "Obscured"
        string oversightMethod; // "Citizen panel", "Audit trail", "Legislative review"
        string emotionalTag;
        bool logged;
        bool sealed;
    }

    OversightEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function logOversight(string memory partylistName, uint256 budgetAllocated, string memory transparencyStatus, string memory oversightMethod, string memory emotionalTag) external onlySteward {
        entries.push(OversightEntry(partylistName, budgetAllocated, transparencyStatus, oversightMethod, emotionalTag, true, false));
    }

    function sealOversightEntry(uint256 index) external onlySteward {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getOversightEntry(uint256 index) external view returns (OversightEntry memory) {
        return entries[index];
    }
}
