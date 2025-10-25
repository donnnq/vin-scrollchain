// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DaingToSenateOversightTreaty {
    address public steward;

    struct OversightEntry {
        string daingID; // "Catmon-Daing-001"
        string issueRaised; // "Delayed response", "No early warning", "Water shortage"
        string senateAction; // "Committee hearing", "Scrollchain testimony", "Public resolution"
        string emotionalTag;
        bool acknowledged;
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

    function escalateDaing(string memory daingID, string memory issueRaised, string memory senateAction, string memory emotionalTag) external onlySteward {
        entries.push(OversightEntry(daingID, issueRaised, senateAction, emotionalTag, true, false));
    }

    function sealOversightEntry(uint256 index) external onlySteward {
        require(entries[index].acknowledged, "Must be acknowledged first");
        entries[index].sealed = true;
    }

    function getOversightEntry(uint256 index) external view returns (OversightEntry memory) {
        return entries[index];
    }
}
