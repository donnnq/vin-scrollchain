// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JudicialDignityCodex {
    address public steward;

    struct DignityEntry {
        string judgeName;
        string rulingContext;
        string dignityImpact;
        string emotionalTag;
    }

    DignityEntry[] public codex;

    event JudicialDignityLogged(string judgeName, string rulingContext, string dignityImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logDignity(
        string memory judgeName,
        string memory rulingContext,
        string memory dignityImpact,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(DignityEntry(judgeName, rulingContext, dignityImpact, emotionalTag));
        emit JudicialDignityLogged(judgeName, rulingContext, dignityImpact, emotionalTag);
    }
}
