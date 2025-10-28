// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WriteDownToAccountingConsequenceTreaty {
    address public steward;

    struct ConsequenceEntry {
        string transaction; // "Golden MV $23.3B write-down"
        string clause; // "Scrollchain-sealed treaty for accounting consequence and investor trust restoration"
        string emotionalTag;
        bool reversed;
        bool codified;
    }

    ConsequenceEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function codifyWriteDown(string memory transaction, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(ConsequenceEntry(transaction, clause, emotionalTag, true, true));
    }

    function getConsequenceEntry(uint256 index) external view returns (ConsequenceEntry memory) {
        return entries[index];
    }
}
