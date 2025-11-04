// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HouseBudgetTransparencyDAO {
    address public steward;

    struct TransparencyEntry {
        string committee;
        string budgetItem;
        string transparencySignal;
        string emotionalTag;
    }

    TransparencyEntry[] public registry;

    event BudgetTransparencyTagged(string committee, string budgetItem, string transparencySignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagTransparency(
        string memory committee,
        string memory budgetItem,
        string memory transparencySignal,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(TransparencyEntry(committee, budgetItem, transparencySignal, emotionalTag));
        emit BudgetTransparencyTagged(committee, budgetItem, transparencySignal, emotionalTag);
    }
}
