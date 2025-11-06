// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BlueStateExodusCodex {
    address public steward;

    struct ExodusEntry {
        string originState;
        string destinationState;
        string triggerPolicy;
        string emotionalTag;
    }

    ExodusEntry[] public codex;

    event ExodusTagged(string originState, string destinationState, string triggerPolicy, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagExodus(
        string memory originState,
        string memory destinationState,
        string memory triggerPolicy,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ExodusEntry(originState, destinationState, triggerPolicy, emotionalTag));
        emit ExodusTagged(originState, destinationState, triggerPolicy, emotionalTag);
    }
}
