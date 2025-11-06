// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthLedRooftopInnovationIndex {
    address public steward;

    struct InnovationEntry {
        string projectName;
        string innovationType;
        string youthGroup;
        string emotionalTag;
    }

    InnovationEntry[] public index;

    event RooftopInnovationTagged(string projectName, string innovationType, string youthGroup, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagInnovation(
        string memory projectName,
        string memory innovationType,
        string memory youthGroup,
        string memory emotionalTag
    ) public onlySteward {
        index.push(InnovationEntry(projectName, innovationType, youthGroup, emotionalTag));
        emit RooftopInnovationTagged(projectName, innovationType, youthGroup, emotionalTag);
    }
}
