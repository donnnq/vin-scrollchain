// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicSpendingTransparencyDAO {
    address public steward;

    struct SpendingEntry {
        string agency;
        string projectName;
        string transparencySignal;
        string emotionalTag;
    }

    SpendingEntry[] public registry;

    event PublicSpendingTagged(string agency, string projectName, string transparencySignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSpending(
        string memory agency,
        string memory projectName,
        string memory transparencySignal,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(SpendingEntry(agency, projectName, transparencySignal, emotionalTag));
        emit PublicSpendingTagged(agency, projectName, transparencySignal, emotionalTag);
    }
}
