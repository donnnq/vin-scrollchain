// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CitywideFestivalDAO {
    address public steward;

    struct FestivalEntry {
        string city;
        string festivalName;
        string culturalTheme;
        string emotionalTag;
    }

    FestivalEntry[] public registry;

    event FestivalTagged(string city, string festivalName, string culturalTheme, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagFestival(
        string memory city,
        string memory festivalName,
        string memory culturalTheme,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(FestivalEntry(city, festivalName, culturalTheme, emotionalTag));
        emit FestivalTagged(city, festivalName, culturalTheme, emotionalTag);
    }
}
