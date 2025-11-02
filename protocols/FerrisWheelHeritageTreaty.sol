// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FerrisWheelHeritageTreaty {
    address public steward;

    struct FerrisClause {
        string city;
        string wheelName;
        string heritagePurpose;
        string emotionalTag;
    }

    FerrisClause[] public treatyLog;

    event FerrisWheelTagged(string city, string wheelName, string heritagePurpose, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagFerrisWheel(
        string memory city,
        string memory wheelName,
        string memory heritagePurpose,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(FerrisClause(city, wheelName, heritagePurpose, emotionalTag));
        emit FerrisWheelTagged(city, wheelName, heritagePurpose, emotionalTag);
    }
}
