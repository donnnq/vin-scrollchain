// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodexToInnovationImmunity {
    address public steward;

    struct ImmunityClause {
        string creatorID;
        string corridor;
        string threatSource;
        string protectionTag;
    }

    ImmunityClause[] public codex;

    event ImmunityGranted(string creatorID, string corridor, string threatSource, string protectionTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function grantImmunity(
        string memory creatorID,
        string memory corridor,
        string memory threatSource,
        string memory protectionTag
    ) public onlySteward {
        codex.push(ImmunityClause(creatorID, corridor, threatSource, protectionTag));
        emit ImmunityGranted(creatorID, corridor, threatSource, protectionTag);
    }
}
