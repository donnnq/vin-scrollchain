// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SatireImmunityCodex {
    address public steward;

    struct ImmunityClause {
        string satireTarget;
        string riskVector;
        string immunityProtocol;
        string emotionalTag;
    }

    ImmunityClause[] public codex;

    event SatireImmunityTagged(string satireTarget, string riskVector, string immunityProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagImmunity(
        string memory satireTarget,
        string memory riskVector,
        string memory immunityProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ImmunityClause(satireTarget, riskVector, immunityProtocol, emotionalTag));
        emit SatireImmunityTagged(satireTarget, riskVector, immunityProtocol, emotionalTag);
    }
}
