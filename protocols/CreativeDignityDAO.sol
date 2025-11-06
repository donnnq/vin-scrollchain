// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CreativeDignityDAO {
    address public steward;

    struct DignityEntry {
        string creatorName;
        string medium;
        string dignityProtocol;
        string emotionalTag;
    }

    DignityEntry[] public registry;

    event CreativeDignityTagged(string creatorName, string medium, string dignityProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagDignity(
        string memory creatorName,
        string memory medium,
        string memory dignityProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(DignityEntry(creatorName, medium, dignityProtocol, emotionalTag));
        emit CreativeDignityTagged(creatorName, medium, dignityProtocol, emotionalTag);
    }
}
