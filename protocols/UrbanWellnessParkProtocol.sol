// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanWellnessParkProtocol {
    address public steward;

    struct WellnessEntry {
        string parkName;
        string wellnessFeature;
        string civicBenefit;
        string emotionalTag;
    }

    WellnessEntry[] public protocol;

    event WellnessParkTagged(string parkName, string wellnessFeature, string civicBenefit, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagWellness(
        string memory parkName,
        string memory wellnessFeature,
        string memory civicBenefit,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(WellnessEntry(parkName, wellnessFeature, civicBenefit, emotionalTag));
        emit WellnessParkTagged(parkName, wellnessFeature, civicBenefit, emotionalTag);
    }
}
