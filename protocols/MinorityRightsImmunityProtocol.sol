// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MinorityRightsImmunityProtocol {
    address public steward;

    struct ImmunityClause {
        string minorityGroup;
        string legislativeThreat;
        string immunityProtocol;
        string emotionalTag;
    }

    ImmunityClause[] public registry;

    event MinorityRightsTagged(string minorityGroup, string legislativeThreat, string immunityProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagImmunity(
        string memory minorityGroup,
        string memory legislativeThreat,
        string memory immunityProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ImmunityClause(minorityGroup, legislativeThreat, immunityProtocol, emotionalTag));
        emit MinorityRightsTagged(minorityGroup, legislativeThreat, immunityProtocol, emotionalTag);
    }
}
