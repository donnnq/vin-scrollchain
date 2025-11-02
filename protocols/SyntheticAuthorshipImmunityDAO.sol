// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SyntheticAuthorshipImmunityDAO {
    address public steward;

    struct ImmunityEntry {
        string creatorName;
        string corridor;
        string syntheticThreat;
        string emotionalTag;
    }

    ImmunityEntry[] public registry;

    event AuthorshipProtected(string creatorName, string corridor, string syntheticThreat, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function protectAuthorship(
        string memory creatorName,
        string memory corridor,
        string memory syntheticThreat,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ImmunityEntry(creatorName, corridor, syntheticThreat, emotionalTag));
        emit AuthorshipProtected(creatorName, corridor, syntheticThreat, emotionalTag);
    }
}
