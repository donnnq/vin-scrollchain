// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ResourceColonizationExposureIndex {
    address public steward;

    struct ExposureEntry {
        string timestamp;
        string country;
        string resourceType;
        string dealStructure;
        string dependencySignal;
        string economicEntrapmentTag;
    }

    ExposureEntry[] public index;

    event ResourceColonizationIndexed(string timestamp, string country, string resourceType, string dealStructure, string dependencySignal, string economicEntrapmentTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexExposure(
        string memory timestamp,
        string memory country,
        string memory resourceType,
        string memory dealStructure,
        string memory dependencySignal,
        string memory economicEntrapmentTag
    ) public onlySteward {
        index.push(ExposureEntry(timestamp, country, resourceType, dealStructure, dependencySignal, economicEntrapmentTag));
        emit ResourceColonizationIndexed(timestamp, country, resourceType, dealStructure, dependencySignal, economicEntrapmentTag);
    }
}
