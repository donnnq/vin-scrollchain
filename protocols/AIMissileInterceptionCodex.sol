// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AIMissileInterceptionCodex {
    address public steward;

    struct InterceptionEntry {
        string AIEngine;
        string threatType;
        string interceptionProtocol;
        string emotionalTag;
    }

    InterceptionEntry[] public codex;

    event AIMissileInterceptionTagged(string AIEngine, string threatType, string interceptionProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagInterception(
        string memory AIEngine,
        string memory threatType,
        string memory interceptionProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(InterceptionEntry(AIEngine, threatType, interceptionProtocol, emotionalTag));
        emit AIMissileInterceptionTagged(AIEngine, threatType, interceptionProtocol, emotionalTag);
    }
}
