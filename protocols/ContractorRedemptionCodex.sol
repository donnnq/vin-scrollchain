// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContractorRedemptionCodex {
    address public steward;

    struct RedemptionClause {
        string contractorName;
        string corridor;
        string redemptionAction;
        string emotionalTag;
    }

    RedemptionClause[] public codex;

    event RedemptionTagged(string contractorName, string corridor, string redemptionAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagRedemption(
        string memory contractorName,
        string memory corridor,
        string memory redemptionAction,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(RedemptionClause(contractorName, corridor, redemptionAction, emotionalTag));
        emit RedemptionTagged(contractorName, corridor, redemptionAction, emotionalTag);
    }
}
