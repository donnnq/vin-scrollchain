// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodZoneMappingDAO {
    address public steward;

    struct FloodZone {
        string location;
        string timestamp;
        string riskLevel;
        string mappingSource;
        string emotionalTag;
    }

    FloodZone[] public zones;

    event FloodZoneMapped(string location, string timestamp, string riskLevel, string mappingSource, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function mapZone(
        string memory location,
        string memory timestamp,
        string memory riskLevel,
        string memory mappingSource,
        string memory emotionalTag
    ) public onlySteward {
        zones.push(FloodZone(location, timestamp, riskLevel, mappingSource, emotionalTag));
        emit FloodZoneMapped(location, timestamp, riskLevel, mappingSource, emotionalTag);
    }
}
