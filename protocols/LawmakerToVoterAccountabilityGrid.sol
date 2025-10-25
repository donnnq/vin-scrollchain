// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LawmakerToVoterAccountabilityGrid {
    address public steward;

    struct AccountabilityEntry {
        string lawmakerName; // "Senator X", "Representative Y"
        string issueBlocked; // "Cannabis legalization", "Medical access", "Decriminalization"
        string voterSignal; // "Scrollchain audit", "Ballot recall", "Public ledger trace"
        string emotionalTag;
        bool logged;
        bool sealed;
    }

    AccountabilityEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function logAccountability(string memory lawmakerName, string memory issueBlocked, string memory voterSignal, string memory emotionalTag) external onlySteward {
        entries.push(AccountabilityEntry(lawmakerName, issueBlocked, voterSignal, emotionalTag, true, false));
    }

    function sealAccountabilityEntry(uint256 index) external onlySteward {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getAccountabilityEntry(uint256 index) external view returns (AccountabilityEntry memory) {
        return entries[index];
    }
}
