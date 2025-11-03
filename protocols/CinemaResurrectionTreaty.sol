// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CinemaResurrectionTreaty {
    address public steward;

    struct CinemaClause {
        string mallName;
        string cinemaStatus;
        string resurrectionPlan;
        string emotionalTag;
    }

    CinemaClause[] public treatyLog;

    event CinemaResurrectionTagged(string mallName, string cinemaStatus, string resurrectionPlan, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagCinema(
        string memory mallName,
        string memory cinemaStatus,
        string memory resurrectionPlan,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(CinemaClause(mallName, cinemaStatus, resurrectionPlan, emotionalTag));
        emit CinemaResurrectionTagged(mallName, cinemaStatus, resurrectionPlan, emotionalTag);
    }
}
