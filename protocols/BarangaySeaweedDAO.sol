// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangaySeaweedDAO {
    address public steward;

    struct SeaweedEntry {
        string barangay;
        string seaweedType;
        string cultivationPartner;
        string emotionalTag;
    }

    SeaweedEntry[] public registry;

    event SeaweedTagged(string barangay, string seaweedType, string cultivationPartner, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSeaweed(
        string memory barangay,
        string memory seaweedType,
        string memory cultivationPartner,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(SeaweedEntry(barangay, seaweedType, cultivationPartner, emotionalTag));
        emit SeaweedTagged(barangay, seaweedType, cultivationPartner, emotionalTag);
    }
}
