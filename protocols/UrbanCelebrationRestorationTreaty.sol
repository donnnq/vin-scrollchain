// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanCelebrationRestorationTreaty {
    address public steward;

    struct CelebrationClause {
        string city;
        string celebrationType;
        string restorationAction;
        string emotionalTag;
    }

    CelebrationClause[] public treatyLog;

    event CelebrationRestored(string city, string celebrationType, string restorationAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function restoreCelebration(
        string memory city,
        string memory celebrationType,
        string memory restorationAction,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(CelebrationClause(city, celebrationType, restorationAction, emotionalTag));
        emit CelebrationRestored(city, celebrationType, restorationAction, emotionalTag);
    }
}
