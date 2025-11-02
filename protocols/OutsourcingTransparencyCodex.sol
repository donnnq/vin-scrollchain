// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OutsourcingTransparencyCodex {
    address public steward;

    struct TransparencyClause {
        string companyName;
        string corridor;
        string outsourcingAction;
        string emotionalTag;
    }

    TransparencyClause[] public codex;

    event OutsourcingTagged(string companyName, string corridor, string outsourcingAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagOutsourcing(
        string memory companyName,
        string memory corridor,
        string memory outsourcingAction,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(TransparencyClause(companyName, corridor, outsourcingAction, emotionalTag));
        emit OutsourcingTagged(companyName, corridor, outsourcingAction, emotionalTag);
    }
}
