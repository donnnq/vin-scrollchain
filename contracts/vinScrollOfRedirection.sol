// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinScrollOfRedirection.sol
/// @notice Tracks soul reform through purposeful missions

contract vinScrollOfRedirection {
    struct ReformScroll {
        address soul;
        string mission;
        string impactReport;
        bool completed;
    }

    mapping(address => ReformScroll) public redirections;
    address public redirectionCouncil;

    modifier onlyCouncil() {
        require(msg.sender == redirectionCouncil, "Unauthorized");
        _;
    }

    constructor() {
        redirectionCouncil = msg.sender;
    }

    function assignMission(address soul, string memory mission) public onlyCouncil {
        redirections[soul] = ReformScroll(soul, mission, "", false);
    }

    function logImpact(address soul, string memory report) public onlyCouncil {
        redirections[soul].impactReport = report;
        redirections[soul].completed = true;
    }

    function fetchScroll(address soul) public view returns (ReformScroll memory) {
        return redirections[soul];
    }
}
