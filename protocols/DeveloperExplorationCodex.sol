// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeveloperExplorationCodex {
    address public steward;

    struct ExplorationEntry {
        string devTool;
        string useCase;
        string breakthrough;
        string emotionalTag;
    }

    ExplorationEntry[] public codex;

    event DeveloperExplorationLogged(string devTool, string useCase, string breakthrough, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logExploration(
        string memory devTool,
        string memory useCase,
        string memory breakthrough,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ExplorationEntry(devTool, useCase, breakthrough, emotionalTag));
        emit DeveloperExplorationLogged(devTool, useCase, breakthrough, emotionalTag);
    }
}
