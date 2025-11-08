// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalPRImageLaunderingIndex {
    address public steward;

    struct LaunderingEntry {
        string timestamp;
        string originCountry;
        string campaignMedium;
        string geopoliticalIntent;
        string imageLaunderingSignal;
        string emotionalTag;
    }

    LaunderingEntry[] public index;

    event ImageLaunderingIndexed(string timestamp, string originCountry, string campaignMedium, string geopoliticalIntent, string imageLaunderingSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexLaundering(
        string memory timestamp,
        string memory originCountry,
        string memory campaignMedium,
        string memory geopoliticalIntent,
        string memory imageLaunderingSignal,
        string memory emotionalTag
    ) public onlySteward {
        index.push(LaunderingEntry(timestamp, originCountry, campaignMedium, geopoliticalIntent, imageLaunderingSignal, emotionalTag));
        emit ImageLaunderingIndexed(timestamp, originCountry, campaignMedium, geopoliticalIntent, imageLaunderingSignal, emotionalTag);
    }
}
