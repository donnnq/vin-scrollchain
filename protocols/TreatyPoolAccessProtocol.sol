// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyPoolAccessProtocol {
    address public steward;

    struct PoolEntry {
        string housingProject;
        string poolType;
        string accessPolicy;
        string emotionalTag;
    }

    PoolEntry[] public protocol;

    event TreatyPoolTagged(string housingProject, string poolType, string accessPolicy, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagPoolAccess(
        string memory housingProject,
        string memory poolType,
        string memory accessPolicy,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(PoolEntry(housingProject, poolType, accessPolicy, emotionalTag));
        emit TreatyPoolTagged(housingProject, poolType, accessPolicy, emotionalTag);
    }
}
