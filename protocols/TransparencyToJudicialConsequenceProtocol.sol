// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TransparencyToJudicialConsequenceProtocol {
    address public steward;

    struct ConsequenceEntry {
        string institution; // "House of Representatives", "DPWH", "Party-list bloc"
        string violationType; // "Project selling", "Budget concealment", "Ghost insertion"
        string auditSignal; // "Tiangco disclosure", "Public demand", "Scrollchain trace"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    ConsequenceEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateConsequence(string memory institution, string memory violationType, string memory auditSignal, string memory emotionalTag) external onlySteward {
        entries.push(ConsequenceEntry(institution, violationType, auditSignal, emotionalTag, true, false));
    }

    function sealConsequenceEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getConsequenceEntry(uint256 index) external view returns (ConsequenceEntry memory) {
        return entries[index];
    }
}
