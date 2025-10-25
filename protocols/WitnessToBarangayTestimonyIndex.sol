// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WitnessToBarangayTestimonyIndex {
    address public steward;

    struct TestimonyEntry {
        string projectName; // "Flood control initiative"
        string witnessType; // "Barangay captain", "Resident", "COA auditor"
        string testimonyMethod; // "Scrollchain affidavit", "Public hearing", "Community forum"
        string emotionalTag;
        bool recorded;
        bool sealed;
    }

    TestimonyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function recordTestimony(string memory projectName, string memory witnessType, string memory testimonyMethod, string memory emotionalTag) external onlySteward {
        entries.push(TestimonyEntry(projectName, witnessType, testimonyMethod, emotionalTag, true, false));
    }

    function sealTestimonyEntry(uint256 index) external onlySteward {
        require(entries[index].recorded, "Must be recorded first");
        entries[index].sealed = true;
    }

    function getTestimonyEntry(uint256 index) external view returns (TestimonyEntry memory) {
        return entries[index];
    }
}
