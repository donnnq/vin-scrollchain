// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PedestrianComfortKarmaLedger {
    address public steward;

    struct ComfortEntry {
        string walkwayLocation;
        string comfortScore;
        string improvementProtocol;
        string emotionalTag;
    }

    ComfortEntry[] public ledger;

    event PedestrianComfortTagged(string walkwayLocation, string comfortScore, string improvementProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagComfort(
        string memory walkwayLocation,
        string memory comfortScore,
        string memory improvementProtocol,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(ComfortEntry(walkwayLocation, comfortScore, improvementProtocol, emotionalTag));
        emit PedestrianComfortTagged(walkwayLocation, comfortScore, improvementProtocol, emotionalTag);
    }
}
