// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TruthSocialRhetoricContainmentTreaty {
    address public steward;

    struct RhetoricClause {
        string platform;
        string statement;
        string containmentProtocol;
        string emotionalTag;
    }

    RhetoricClause[] public treatyLog;

    event RhetoricContained(string platform, string statement, string containmentProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containRhetoric(
        string memory platform,
        string memory statement,
        string memory containmentProtocol,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(RhetoricClause(platform, statement, containmentProtocol, emotionalTag));
        emit RhetoricContained(platform, statement, containmentProtocol, emotionalTag);
    }
}
