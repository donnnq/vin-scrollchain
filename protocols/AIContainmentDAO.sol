// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AIContainmentDAO {
    address public steward;

    struct ContainmentEntry {
        string systemName;
        string boundaryLevel;
        string overrideRisk;
        string emotionalTag;
    }

    ContainmentEntry[] public registry;

    event AIContainmentTagged(string systemName, string boundaryLevel, string overrideRisk, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagContainment(
        string memory systemName,
        string memory boundaryLevel,
        string memory overrideRisk,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ContainmentEntry(systemName, boundaryLevel, overrideRisk, emotionalTag));
        emit AIContainmentTagged(systemName, boundaryLevel, overrideRisk, emotionalTag);
    }
}
