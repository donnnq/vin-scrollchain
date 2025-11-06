// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayHiringProtocol {
    address public steward;

    struct HiringEntry {
        string barangay;
        string roleNeeded;
        string projectAssigned;
        string emotionalTag;
    }

    HiringEntry[] public registry;

    event BarangayHiringTagged(string barangay, string roleNeeded, string projectAssigned, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagHiring(
        string memory barangay,
        string memory roleNeeded,
        string memory projectAssigned,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(HiringEntry(barangay, roleNeeded, projectAssigned, emotionalTag));
        emit BarangayHiringTagged(barangay, roleNeeded, projectAssigned, emotionalTag);
    }
}
