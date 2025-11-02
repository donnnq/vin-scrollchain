// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PasigComfortTreaty {
    address public steward;

    struct ComfortClause {
        string esplanadeZone;
        string comfortUpgrade;
        string restrictionBarrier;
        string emotionalTag;
    }

    ComfortClause[] public treatyLog;

    event PasigComfortTagged(string esplanadeZone, string comfortUpgrade, string restrictionBarrier, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagComfort(
        string memory esplanadeZone,
        string memory comfortUpgrade,
        string memory restrictionBarrier,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(ComfortClause(esplanadeZone, comfortUpgrade, restrictionBarrier, emotionalTag));
        emit PasigComfortTagged(esplanadeZone, comfortUpgrade, restrictionBarrier, emotionalTag);
    }
}
