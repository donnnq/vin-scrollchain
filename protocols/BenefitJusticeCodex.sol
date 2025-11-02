// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BenefitJusticeCodex {
    address public steward;

    struct JusticeEntry {
        string citizenGroup;
        string denialReason;
        string remedyAction;
        string emotionalTag;
    }

    JusticeEntry[] public codex;

    event BenefitJusticeLogged(string citizenGroup, string denialReason, string remedyAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logBenefitJustice(
        string memory citizenGroup,
        string memory denialReason,
        string memory remedyAction,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(JusticeEntry(citizenGroup, denialReason, remedyAction, emotionalTag));
        emit BenefitJusticeLogged(citizenGroup, denialReason, remedyAction, emotionalTag);
    }
}
