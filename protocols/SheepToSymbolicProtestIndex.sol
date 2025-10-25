// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SheepToSymbolicProtestIndex {
    address public steward;

    struct ProtestEntry {
        string location; // "Mingdu Street Office, Xi’an"
        string date; // "October 19, 2025"
        string protestSignal; // "Gate blockade", "Collective petition"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    ProtestEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexProtest(string memory location, string memory date, string memory protestSignal, string memory emotionalTag) external onlySteward {
        entries.push(ProtestEntry(location, date, protestSignal, emotionalTag, true, false));
    }

    function sealProtestEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getProtestEntry(uint256 index) external view returns (ProtestEntry memory) {
        return entries[index];
    }
}
