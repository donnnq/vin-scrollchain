// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RetailVibeCodex {
    address public steward;

    struct VibeEntry {
        string mallZone;
        string vibeLevel;
        string activationProtocol;
        string emotionalTag;
    }

    VibeEntry[] public codex;

    event RetailVibeLogged(string mallZone, string vibeLevel, string activationProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logVibe(
        string memory mallZone,
        string memory vibeLevel,
        string memory activationProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(VibeEntry(mallZone, vibeLevel, activationProtocol, emotionalTag));
        emit RetailVibeLogged(mallZone, vibeLevel, activationProtocol, emotionalTag);
    }
}
