// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SpaceDebrisDAO {
    address public steward;

    struct DebrisEntry {
        string debrisType;
        string originSource;
        string mitigationProtocol;
        string emotionalTag;
    }

    DebrisEntry[] public registry;

    event SpaceDebrisTagged(string debrisType, string originSource, string mitigationProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagDebris(
        string memory debrisType,
        string memory originSource,
        string memory mitigationProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(DebrisEntry(debrisType, originSource, mitigationProtocol, emotionalTag));
        emit SpaceDebrisTagged(debrisType, originSource, mitigationProtocol, emotionalTag);
    }
}
