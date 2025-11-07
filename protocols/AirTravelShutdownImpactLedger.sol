// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AirTravelShutdownImpactLedger {
    address public steward;

    struct ShutdownEntry {
        string airportCode;
        string region;
        string timestamp;
        string disruptionType;
        uint256 passengerImpact;
        string economicFallout;
        string emotionalTag;
    }

    ShutdownEntry[] public ledger;

    event AirTravelDisruptionLogged(string airportCode, string region, string timestamp, string disruptionType, uint256 passengerImpact, string economicFallout, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logDisruption(
        string memory airportCode,
        string memory region,
        string memory timestamp,
        string memory disruptionType,
        uint256 passengerImpact,
        string memory economicFallout,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(ShutdownEntry(airportCode, region, timestamp, disruptionType, passengerImpact, economicFallout, emotionalTag));
        emit AirTravelDisruptionLogged(airportCode, region, timestamp, disruptionType, passengerImpact, economicFallout, emotionalTag);
    }
}
