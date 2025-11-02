// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicComfortTreaty {
    address public steward;

    struct ComfortClause {
        string publicSpace;
        string comfortFeature;
        string restrictionBarrier;
        string emotionalTag;
    }

    ComfortClause[] public treatyLog;

    event CivicComfortTagged(string publicSpace, string comfortFeature, string restrictionBarrier, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagComfort(
        string memory publicSpace,
        string memory comfortFeature,
        string memory restrictionBarrier,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(ComfortClause(publicSpace, comfortFeature, restrictionBarrier, emotionalTag));
        emit CivicComfortTagged(publicSpace, comfortFeature, restrictionBarrier, emotionalTag);
    }
}
