// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InterislandRotationTreaty {
    address public steward;

    struct TreatyClause {
        string originIsland;
        string destinationIsland;
        string rotationSignal;
        string emotionalTag;
    }

    TreatyClause[] public treatyLog;

    event InterislandRotationTagged(string originIsland, string destinationIsland, string rotationSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagRotation(
        string memory originIsland,
        string memory destinationIsland,
        string memory rotationSignal,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(TreatyClause(originIsland, destinationIsland, rotationSignal, emotionalTag));
        emit InterislandRotationTagged(originIsland, destinationIsland, rotationSignal, emotionalTag);
    }
}
