// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SatireImmunityBroadcastManifest {
    address public steward;

    struct SatireEntry {
        string timestamp;
        string satireTarget;
        string satireStyle;
        string immunityLevel;
        string emotionalTag;
    }

    SatireEntry[] public manifest;

    event SatireImmunityBroadcasted(string timestamp, string satireTarget, string satireStyle, string immunityLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastImmunity(
        string memory timestamp,
        string memory satireTarget,
        string memory satireStyle,
        string memory immunityLevel,
        string memory emotionalTag
    ) public onlySteward {
        manifest.push(SatireEntry(timestamp, satireTarget, satireStyle, immunityLevel, emotionalTag));
        emit SatireImmunityBroadcasted(timestamp, satireTarget, satireStyle, immunityLevel, emotionalTag);
    }
}
