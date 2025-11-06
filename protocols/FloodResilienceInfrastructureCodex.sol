// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodResilienceInfrastructureCodex {
    address public steward;

    struct InfrastructureEntry {
        string barangay;
        string floodZone;
        string resilienceProtocol;
        string emotionalTag;
    }

    InfrastructureEntry[] public codex;

    event FloodResilienceTagged(string barangay, string floodZone, string resilienceProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagResilience(
        string memory barangay,
        string memory floodZone,
        string memory resilienceProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(InfrastructureEntry(barangay, floodZone, resilienceProtocol, emotionalTag));
        emit FloodResilienceTagged(barangay, floodZone, resilienceProtocol, emotionalTag);
    }
}
