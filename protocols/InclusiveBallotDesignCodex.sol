// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InclusiveBallotDesignCodex {
    address public steward;

    struct DesignEntry {
        string ballotFormat;
        string accessibilityChallenge;
        string designSolution;
        string emotionalTag;
    }

    DesignEntry[] public codex;

    event BallotDesignLogged(string ballotFormat, string accessibilityChallenge, string designSolution, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logDesign(
        string memory ballotFormat,
        string memory accessibilityChallenge,
        string memory designSolution,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(DesignEntry(ballotFormat, accessibilityChallenge, designSolution, emotionalTag));
        emit BallotDesignLogged(ballotFormat, accessibilityChallenge, designSolution, emotionalTag);
    }
}
