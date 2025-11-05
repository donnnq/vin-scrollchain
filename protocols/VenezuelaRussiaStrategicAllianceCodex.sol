// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VenezuelaRussiaStrategicAllianceCodex {
    address public steward;

    struct AllianceEntry {
        string partnerNation;
        string allianceSignal;
        string strategicMechanism;
        string emotionalTag;
    }

    AllianceEntry[] public codex;

    event StrategicAllianceTagged(string partnerNation, string allianceSignal, string strategicMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagAlliance(
        string memory partnerNation,
        string memory allianceSignal,
        string memory strategicMechanism,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(AllianceEntry(partnerNation, allianceSignal, strategicMechanism, emotionalTag));
        emit StrategicAllianceTagged(partnerNation, allianceSignal, strategicMechanism, emotionalTag);
    }
}
