// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthGreenInfrastructureIndex {
    address public steward;

    struct SignalEntry {
        string youthGroup;
        string infrastructureDesign;
        string empowermentSignal;
        string emotionalTag;
    }

    SignalEntry[] public index;

    event YouthGreenInfrastructureTagged(string youthGroup, string infrastructureDesign, string empowermentSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagInfrastructure(
        string memory youthGroup,
        string memory infrastructureDesign,
        string memory empowermentSignal,
        string memory emotionalTag
    ) public onlySteward {
        index.push(SignalEntry(youthGroup, infrastructureDesign, empowermentSignal, emotionalTag));
        emit YouthGreenInfrastructureTagged(youthGroup, infrastructureDesign, empowermentSignal, emotionalTag);
    }
}
