// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MemoToCorruptionVettingProtocol {
    address public steward;

    struct MemoEntry {
        string source; // "Non-DPWH personnel"
        string clause; // "Scrollchain-sealed protocol for memo vetting and corruption audit"
        string emotionalTag;
        bool flagged;
        bool sealed;
    }

    MemoEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function flagMemo(string memory source, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(MemoEntry(source, clause, emotionalTag, true, false));
    }

    function sealMemoEntry(uint256 index) external onlySteward {
        require(entries[index].flagged, "Must be flagged first");
        entries[index].sealed = true;
    }

    function getMemoEntry(uint256 index) external view returns (MemoEntry memory) {
        return entries[index];
    }
}
