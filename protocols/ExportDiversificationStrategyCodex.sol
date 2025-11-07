// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExportDiversificationStrategyCodex {
    address public steward;

    struct StrategyEntry {
        string sectorName;
        string diversificationMethod;
        string targetMarkets;
        string emotionalTag;
    }

    StrategyEntry[] public codex;

    event ExportDiversificationTagged(string sectorName, string diversificationMethod, string targetMarkets, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagDiversification(
        string memory sectorName,
        string memory diversificationMethod,
        string memory targetMarkets,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(StrategyEntry(sectorName, diversificationMethod, targetMarkets, emotionalTag));
        emit ExportDiversificationTagged(sectorName, diversificationMethod, targetMarkets, emotionalTag);
    }
}
