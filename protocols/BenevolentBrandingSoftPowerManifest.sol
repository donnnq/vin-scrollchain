// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BenevolentBrandingSoftPowerManifest {
    address public steward;

    struct BrandingEntry {
        string timestamp;
        string originCountry;
        string campaignType;
        string geopoliticalIntent;
        string imageLaunderingSignal;
        string emotionalTag;
    }

    BrandingEntry[] public manifest;

    event SoftPowerManifested(string timestamp, string originCountry, string campaignType, string geopoliticalIntent, string imageLaunderingSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function manifestSoftPower(
        string memory timestamp,
        string memory originCountry,
        string memory campaignType,
        string memory geopoliticalIntent,
        string memory imageLaunderingSignal,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(BrandingEntry(timestamp, originCountry, campaignType, geopoliticalIntent, imageLaunderingSignal, emotionalTag));
        emit SoftPowerManifested(timestamp, originCountry, campaignType, geopoliticalIntent, imageLaunderingSignal, emotionalTag);
    }
}
