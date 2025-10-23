// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicSatireToPolicyIndex {
    address public steward;

    struct SatireEntry {
        string segmentTitle; // "Corruption Lab", "Departments That Lie"
        string satiristName; // "Troy Iwata", "Michael Kosta"
        string civicIssue; // "Executive grift", "Agency dishonesty"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    SatireEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexSatire(string memory segmentTitle, string memory satiristName, string memory civicIssue, string memory emotionalTag) external onlySteward {
        entries.push(SatireEntry(segmentTitle, satiristName, civicIssue, emotionalTag, true, false));
    }

    function sealSatireEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getSatireEntry(uint256 index) external view returns (SatireEntry memory) {
        return entries[index];
    }
}
