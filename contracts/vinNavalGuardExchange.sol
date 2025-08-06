// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title vinNavalGuardExchange
 * @dev Encodes diplomatic rotation of naval forces among PH, India, and US for regional harmony and maritime protection.
 */

contract vinNavalGuardExchange {
    address public initiator;
    string public peaceSymbol = "⚓🌍🤝";
    uint256 public rotationInterval = 90 days;

    struct NavalUnit {
        string country;
        string vesselName;
        string peaceFunction; // e.g., surveillance, humanitarian drop, reef protection
        uint256 activeFrom;
        uint256 activeUntil;
        bool ritualBlessed;
    }

    NavalUnit[] public fleetRotation;

    event VesselDeployed(string country, string vesselName, string peaceFunction, uint256 durationDays, bool ritualBlessed);

    modifier onlyInitiator() {
        require(msg.sender == initiator, "Only the initiator can rotate fleet");
        _;
    }

    constructor() {
        initiator = msg.sender;

        // Sample vessels
        fleetRotation.push(NavalUnit("India", "INS DharmaGuardian", "BrahMos Peace Patrol", block.timestamp, block.timestamp + rotationInterval, true));
        fleetRotation.push(NavalUnit("Philippines", "BRP Katatagan", "Reef Monitoring & Relief Drop", block.timestamp + rotationInterval, block.timestamp + 2 * rotationInterval, true));
        fleetRotation.push(NavalUnit("USA", "USS Liberty Sigil", "Surveillance & Joint Rescue", block.timestamp + 2 * rotationInterval, block.timestamp + 3 * rotationInterval, false));
    }

    function rotateFleet(
        string memory _country,
        string memory _vessel,
        string memory _function,
        uint256 _start,
        uint256 _end,
        bool _blessed
    ) public onlyInitiator {
        fleetRotation.push(NavalUnit(_country, _vessel, _function, _start, _end, _blessed));
        emit VesselDeployed(_country, _vessel, _function, (_end - _start) / 1 days, _blessed);
    }

    function viewFleet() public view returns (NavalUnit[] memory) {
        return fleetRotation;
    }

    function allianceSigil() public view returns (string memory) {
        return peaceSymbol;
    }
}
