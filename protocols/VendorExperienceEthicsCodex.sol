// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VendorExperienceEthicsCodex {
    address public steward;

    struct VendorClause {
        string vendorType;
        string stationZone;
        string experienceTheme;
        string emotionalTag;
    }

    VendorClause[] public codex;

    event VendorTagged(string vendorType, string stationZone, string experienceTheme, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagVendor(
        string memory vendorType,
        string memory stationZone,
        string memory experienceTheme,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(VendorClause(vendorType, stationZone, experienceTheme, emotionalTag));
        emit VendorTagged(vendorType, stationZone, experienceTheme, emotionalTag);
    }
}
