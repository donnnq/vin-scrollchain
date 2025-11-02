// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForkEthicsCodex {
    address public steward;

    struct ForkEntry {
        string projectName;
        string originSource;
        string remixRespect;
        string emotionalTag;
    }

    ForkEntry[] public codex;

    event ForkEthicsLogged(string projectName, string originSource, string remixRespect, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logFork(
        string memory projectName,
        string memory originSource,
        string memory remixRespect,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ForkEntry(projectName, originSource, remixRespect, emotionalTag));
        emit ForkEthicsLogged(projectName, originSource, remixRespect, emotionalTag);
    }
}
