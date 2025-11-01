// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOMfgDecentralizationProtocol {
    address public steward;

    struct CorridorShift {
        string originCorridor;
        string destinationCorridor;
        string industryType;
        string emotionalTag;
    }

    CorridorShift[] public shiftLog;

    event CorridorShiftTagged(string originCorridor, string destinationCorridor, string industryType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagShift(
        string memory originCorridor,
        string memory destinationCorridor,
        string memory industryType,
        string memory emotionalTag
    ) public onlySteward {
        shiftLog.push(CorridorShift(originCorridor, destinationCorridor, industryType, emotionalTag));
        emit CorridorShiftTagged(originCorridor, destinationCorridor, industryType, emotionalTag);
    }
}
