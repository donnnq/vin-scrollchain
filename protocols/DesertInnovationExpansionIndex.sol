// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DesertInnovationExpansionIndex {
    address public steward;

    struct ExpansionEntry {
        string desertRegion;
        string innovationType;
        string expansionStatus;
        string emotionalTag;
    }

    ExpansionEntry[] public index;

    event DesertInnovationTagged(string desertRegion, string innovationType, string expansionStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagExpansion(
        string memory desertRegion,
        string memory innovationType,
        string memory expansionStatus,
        string memory emotionalTag
    ) public onlySteward {
        index.push(ExpansionEntry(desertRegion, innovationType, expansionStatus, emotionalTag));
        emit DesertInnovationTagged(desertRegion, innovationType, expansionStatus, emotionalTag);
    }
}
