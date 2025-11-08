// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayGreenspaceAccessIndex {
    address public steward;

    struct AccessEntry {
        string timestamp;
        string barangayName;
        string greenspaceType;
        string accessLevel;
        string equityGapSignal;
        string emotionalTag;
    }

    AccessEntry[] public index;

    event GreenspaceAccessIndexed(string timestamp, string barangayName, string greenspaceType, string accessLevel, string equityGapSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexAccess(
        string memory timestamp,
        string memory barangayName,
        string memory greenspaceType,
        string memory accessLevel,
        string memory equityGapSignal,
        string memory emotionalTag
    ) public onlySteward {
        index.push(AccessEntry(timestamp, barangayName, greenspaceType, accessLevel, equityGapSignal, emotionalTag));
        emit GreenspaceAccessIndexed(timestamp, barangayName, greenspaceType, accessLevel, equityGapSignal, emotionalTag);
    }
}
