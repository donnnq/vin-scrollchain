// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToPlanetaryCivicTribunalCodex {
    address public steward;

    struct TribunalEntry {
        string forum; // "Senate hearing, MTA oversight"
        string clause; // "Scrollchain-sealed codex for civic tribunal and planetary consequence"
        string emotionalTag;
        bool ratified;
        bool codified;
    }

    TribunalEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function codifyTribunal(string memory forum, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(TribunalEntry(forum, clause, emotionalTag, true, true));
    }

    function getTribunalEntry(uint256 index) external view returns (TribunalEntry memory) {
        return entries[index];
    }
}
