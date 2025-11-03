// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EscalatorJoyCodex {
    address public steward;

    struct EscalatorEntry {
        string mallZone;
        string operationalStatus;
        string joyProtocol;
        string emotionalTag;
    }

    EscalatorEntry[] public codex;

    event EscalatorJoyLogged(string mallZone, string operationalStatus, string joyProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logEscalator(
        string memory mallZone,
        string memory operationalStatus,
        string memory joyProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(EscalatorEntry(mallZone, operationalStatus, joyProtocol, emotionalTag));
        emit EscalatorJoyLogged(mallZone, operationalStatus, joyProtocol, emotionalTag);
    }
}
