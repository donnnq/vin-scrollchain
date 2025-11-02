// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicResilienceCodex {
    address public steward;

    struct ResilienceEntry {
        string communityName;
        string resilienceAction;
        string recoveryOutcome;
        string emotionalTag;
    }

    ResilienceEntry[] public codex;

    event CivicResilienceLogged(string communityName, string resilienceAction, string recoveryOutcome, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logResilience(
        string memory communityName,
        string memory resilienceAction,
        string memory recoveryOutcome,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ResilienceEntry(communityName, resilienceAction, recoveryOutcome, emotionalTag));
        emit CivicResilienceLogged(communityName, resilienceAction, recoveryOutcome, emotionalTag);
    }
}
