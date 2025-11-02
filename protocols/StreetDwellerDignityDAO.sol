// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StreetDwellerDignityDAO {
    address public steward;

    struct DignityEntry {
        string location;
        string supportAction;
        string dignityStatus;
        string emotionalTag;
    }

    DignityEntry[] public registry;

    event DignityTagged(string location, string supportAction, string dignityStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagDignity(
        string memory location,
        string memory supportAction,
        string memory dignityStatus,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(DignityEntry(location, supportAction, dignityStatus, emotionalTag));
        emit DignityTagged(location, supportAction, dignityStatus, emotionalTag);
    }
}
