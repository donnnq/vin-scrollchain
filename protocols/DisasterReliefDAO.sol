// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DisasterReliefDAO {
    address public steward;

    struct ReliefEntry {
        string disasterType;
        string affectedRegion;
        string reliefProtocol;
        string emotionalTag;
    }

    ReliefEntry[] public registry;

    event DisasterReliefTagged(string disasterType, string affectedRegion, string reliefProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagRelief(
        string memory disasterType,
        string memory affectedRegion,
        string memory reliefProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ReliefEntry(disasterType, affectedRegion, reliefProtocol, emotionalTag));
        emit DisasterReliefTagged(disasterType, affectedRegion, reliefProtocol, emotionalTag);
    }
}
