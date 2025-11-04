// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DPWHAccountabilityCodex {
    address public steward;

    struct AccountabilityEntry {
        string officialName;
        string projectReference;
        string accountabilitySignal;
        string emotionalTag;
    }

    AccountabilityEntry[] public codex;

    event DPWHAccountabilityTagged(string officialName, string projectReference, string accountabilitySignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagAccountability(
        string memory officialName,
        string memory projectReference,
        string memory accountabilitySignal,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(AccountabilityEntry(officialName, projectReference, accountabilitySignal, emotionalTag));
        emit DPWHAccountabilityTagged(officialName, projectReference, accountabilitySignal, emotionalTag);
    }
}
