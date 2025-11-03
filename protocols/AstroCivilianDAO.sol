// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AstroCivilianDAO {
    address public steward;

    struct CivilianEntry {
        string orbitalZone;
        string civilianGroup;
        string protectionProtocol;
        string emotionalTag;
    }

    CivilianEntry[] public registry;

    event AstroCivilianTagged(string orbitalZone, string civilianGroup, string protectionProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagCivilian(
        string memory orbitalZone,
        string memory civilianGroup,
        string memory protectionProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(CivilianEntry(orbitalZone, civilianGroup, protectionProtocol, emotionalTag));
        emit AstroCivilianTagged(orbitalZone, civilianGroup, protectionProtocol, emotionalTag);
    }
}
