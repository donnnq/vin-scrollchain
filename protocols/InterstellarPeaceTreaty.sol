// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InterstellarPeaceTreaty {
    address public steward;

    struct PeaceClause {
        string celestialRegion;
        string conflictTrigger;
        string peaceProtocol;
        string emotionalTag;
    }

    PeaceClause[] public treatyLog;

    event InterstellarPeaceTagged(string celestialRegion, string conflictTrigger, string peaceProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagPeace(
        string memory celestialRegion,
        string memory conflictTrigger,
        string memory peaceProtocol,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(PeaceClause(celestialRegion, conflictTrigger, peaceProtocol, emotionalTag));
        emit InterstellarPeaceTagged(celestialRegion, conflictTrigger, peaceProtocol, emotionalTag);
    }
}
