// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ETFKarmaCodex {
    address public steward;

    struct KarmaClause {
        string asset;
        string corridor;
        string impactType;
        string emotionalTag;
    }

    KarmaClause[] public codex;

    event KarmaTagged(string asset, string corridor, string impactType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagKarma(
        string memory asset,
        string memory corridor,
        string memory impactType,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(KarmaClause(asset, corridor, impactType, emotionalTag));
        emit KarmaTagged(asset, corridor, impactType, emotionalTag);
    }
}
