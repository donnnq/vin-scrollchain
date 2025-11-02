// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SeedMemoryCodex {
    address public steward;

    struct SeedEntry {
        string seedName;
        string heritageOrigin;
        string threatLevel;
        string emotionalTag;
    }

    SeedEntry[] public codex;

    event SeedMemoryLogged(string seedName, string heritageOrigin, string threatLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logSeedMemory(
        string memory seedName,
        string memory heritageOrigin,
        string memory threatLevel,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(SeedEntry(seedName, heritageOrigin, threatLevel, emotionalTag));
        emit SeedMemoryLogged(seedName, heritageOrigin, threatLevel, emotionalTag);
    }
}
