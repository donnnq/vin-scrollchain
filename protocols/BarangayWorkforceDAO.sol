// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayWorkforceDAO {
    address public steward;

    struct WorkforceEntry {
        string residentName;
        string skillSet;
        string preferredWorkType;
        string emotionalTag;
    }

    WorkforceEntry[] public registry;

    event WorkforceTagged(string residentName, string skillSet, string preferredWorkType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagWorkforce(
        string memory residentName,
        string memory skillSet,
        string memory preferredWorkType,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(WorkforceEntry(residentName, skillSet, preferredWorkType, emotionalTag));
        emit WorkforceTagged(residentName, skillSet, preferredWorkType, emotionalTag);
    }
}
