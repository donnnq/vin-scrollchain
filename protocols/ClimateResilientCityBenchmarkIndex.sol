// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClimateResilientCityBenchmarkIndex {
    address public steward;

    struct BenchmarkEntry {
        string city;
        string timestamp;
        uint256 readinessScore;
        string infrastructureStatus;
        string zoningDiscipline;
        string stewardshipLevel;
        string emotionalTag;
    }

    BenchmarkEntry[] public index;

    event CityBenchmarked(string city, string timestamp, uint256 readinessScore, string infrastructureStatus, string zoningDiscipline, string stewardshipLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function benchmarkCity(
        string memory city,
        string memory timestamp,
        uint256 readinessScore,
        string memory infrastructureStatus,
        string memory zoningDiscipline,
        string memory stewardshipLevel,
        string memory emotionalTag
    ) public onlySteward {
        index.push(BenchmarkEntry(city, timestamp, readinessScore, infrastructureStatus, zoningDiscipline, stewardshipLevel, emotionalTag));
        emit CityBenchmarked(city, timestamp, readinessScore, infrastructureStatus, zoningDiscipline, stewardshipLevel, emotionalTag);
    }
}
