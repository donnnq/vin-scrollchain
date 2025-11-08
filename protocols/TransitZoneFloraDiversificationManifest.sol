// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TransitZoneFloraDiversificationManifest {
    address public steward;

    struct FloraEntry {
        string timestamp;
        string transitZone;
        string plantSpecies;
        string ecologicalBenefit;
        string biodiversitySignal;
        string emotionalTag;
    }

    FloraEntry[] public manifest;

    event FloraDiversified(string timestamp, string transitZone, string plantSpecies, string ecologicalBenefit, string biodiversitySignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function diversifyFlora(
        string memory timestamp,
        string memory transitZone,
        string memory plantSpecies,
        string memory ecologicalBenefit,
        string memory biodiversitySignal,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(FloraEntry(timestamp, transitZone, plantSpecies, ecologicalBenefit, biodiversitySignal, emotionalTag));
        emit FloraDiversified(timestamp, transitZone, plantSpecies, ecologicalBenefit, biodiversitySignal, emotionalTag);
    }
}
