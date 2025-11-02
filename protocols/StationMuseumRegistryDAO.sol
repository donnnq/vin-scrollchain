// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StationMuseumRegistryDAO {
    address public steward;

    struct MuseumEntry {
        string stationName;
        string exhibitType;
        string corridor;
        string emotionalTag;
    }

    MuseumEntry[] public registry;

    event MuseumTagged(string stationName, string exhibitType, string corridor, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagMuseum(
        string memory stationName,
        string memory exhibitType,
        string memory corridor,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(MuseumEntry(stationName, exhibitType, corridor, emotionalTag));
        emit MuseumTagged(stationName, exhibitType, corridor, emotionalTag);
    }
}
