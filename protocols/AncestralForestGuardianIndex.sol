// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AncestralForestGuardianIndex {
    address public steward;

    struct GuardianEntry {
        string name;
        string community;
        string timestamp;
        string protectionAction;
        string emotionalTag;
    }

    GuardianEntry[] public index;

    event GuardianLogged(string name, string community, string timestamp, string protectionAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logGuardian(
        string memory name,
        string memory community,
        string memory timestamp,
        string memory protectionAction,
        string memory emotionalTag
    ) public onlySteward {
        index.push(GuardianEntry(name, community, timestamp, protectionAction, emotionalTag));
        emit GuardianLogged(name, community, timestamp, protectionAction, emotionalTag);
    }
}
