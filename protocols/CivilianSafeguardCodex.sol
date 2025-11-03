// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivilianSafeguardCodex {
    address public steward;

    struct SafeguardEntry {
        string conflictZone;
        string AIThreatType;
        string protectionProtocol;
        string emotionalTag;
    }

    SafeguardEntry[] public codex;

    event CivilianSafeguardLogged(string conflictZone, string AIThreatType, string protectionProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logSafeguard(
        string memory conflictZone,
        string memory AIThreatType,
        string memory protectionProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(SafeguardEntry(conflictZone, AIThreatType, protectionProtocol, emotionalTag));
        emit CivilianSafeguardLogged(conflictZone, AIThreatType, protectionProtocol, emotionalTag);
    }
}
