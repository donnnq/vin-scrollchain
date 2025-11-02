// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TransitFlavorSovereigntyDAO {
    address public steward;

    struct FlavorEntry {
        string stationZone;
        string vendorType;
        string flavorTheme;
        string emotionalTag;
    }

    FlavorEntry[] public registry;

    event FlavorTagged(string stationZone, string vendorType, string flavorTheme, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagFlavor(
        string memory stationZone,
        string memory vendorType,
        string memory flavorTheme,
        string memory emotionalTag
    ) public onlySteard {
        registry.push(FlavorEntry(stationZone, vendorType, flavorTheme, emotionalTag));
        emit FlavorTagged(stationZone, vendorType, flavorTheme, emotionalTag);
    }
}
