// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FilibusterImmunityCodex {
    address public steward;

    struct ImmunityEntry {
        string legislativeContext;
        string filibusterImpact;
        string immunityProtocol;
        string emotionalTag;
    }

    ImmunityEntry[] public codex;

    event FilibusterImmunityLogged(string legislativeContext, string filibusterImpact, string immunityProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logImmunity(
        string memory legislativeContext,
        string memory filibusterImpact,
        string memory immunityProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ImmunityEntry(legislativeContext, filibusterImpact, immunityProtocol, emotionalTag));
        emit FilibusterImmunityLogged(legislativeContext, filibusterImpact, immunityProtocol, emotionalTag);
    }
}
