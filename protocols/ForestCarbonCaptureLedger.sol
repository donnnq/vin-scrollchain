// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForestCarbonCaptureLedger {
    address public steward;

    struct CaptureEntry {
        string forestZone;
        string timestamp;
        uint256 carbonCapturedTons;
        string speciesPlanted;
        string emotionalTag;
    }

    CaptureEntry[] public ledger;

    event CarbonCaptured(string forestZone, string timestamp, uint256 carbonCapturedTons, string speciesPlanted, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logCapture(
        string memory forestZone,
        string memory timestamp,
        uint256 carbonCapturedTons,
        string memory speciesPlanted,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(CaptureEntry(forestZone, timestamp, carbonCapturedTons, speciesPlanted, emotionalTag));
        emit CarbonCaptured(forestZone, timestamp, carbonCapturedTons, speciesPlanted, emotionalTag);
    }
}
