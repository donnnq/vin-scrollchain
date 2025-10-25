// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CorruptionToBankTrailAccessGrid {
    address public steward;

    struct AccessEntry {
        string investigationTarget; // "Flood control project anomalies"
        string accessType; // "Bank records", "Tax data", "Digital communications"
        string accessMethod; // "Scrollchain subpoena", "Senate mandate", "IPC audit"
        string emotionalTag;
        bool granted;
        bool sealed;
    }

    AccessEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function grantAccess(string memory investigationTarget, string memory accessType, string memory accessMethod, string memory emotionalTag) external onlySteward {
        entries.push(AccessEntry(investigationTarget, accessType, accessMethod, emotionalTag, true, false));
    }

    function sealAccessEntry(uint256 index) external onlySteward {
        require(entries[index].granted, "Must be granted first");
        entries[index].sealed = true;
    }

    function getAccessEntry(uint256 index) external view returns (AccessEntry memory) {
        return entries[index];
    }
}
