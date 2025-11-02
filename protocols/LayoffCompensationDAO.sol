// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LayoffCompensationDAO {
    address public steward;

    struct LayoffEntry {
        string employerName;
        string sector;
        string compensationPackage;
        string emotionalTag;
    }

    LayoffEntry[] public registry;

    event LayoffCompensationTagged(string employerName, string sector, string compensationPackage, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagLayoffCompensation(
        string memory employerName,
        string memory sector,
        string memory compensationPackage,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(LayoffEntry(employerName, sector, compensationPackage, emotionalTag));
        emit LayoffCompensationTagged(employerName, sector, compensationPackage, emotionalTag);
    }
}
