// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CoolingJusticeIndex {
    address public steward;

    struct JusticeEntry {
        string barangay;
        string coolingAccessScore;
        string vulnerabilityLevel;
        string emotionalTag;
    }

    JusticeEntry[] public index;

    event CoolingJusticeTagged(string barangay, string coolingAccessScore, string vulnerabilityLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagCoolingJustice(
        string memory barangay,
        string memory coolingAccessScore,
        string memory vulnerabilityLevel,
        string memory emotionalTag
    ) public onlySteward {
        index.push(JusticeEntry(barangay, coolingAccessScore, vulnerabilityLevel, emotionalTag));
        emit CoolingJusticeTagged(barangay, coolingAccessScore, vulnerabilityLevel, emotionalTag);
    }
}
