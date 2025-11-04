// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TeacherRoboticsSovereigntyCodex {
    address public steward;

    struct SovereigntyEntry {
        string region;
        string roboticsDomain;
        string empowermentMechanism;
        string emotionalTag;
    }

    SovereigntyEntry[] public codex;

    event RoboticsSovereigntyTagged(string region, string roboticsDomain, string empowermentMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSovereignty(
        string memory region,
        string memory roboticsDomain,
        string memory empowermentMechanism,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(SovereigntyEntry(region, roboticsDomain, empowermentMechanism, emotionalTag));
        emit RoboticsSovereigntyTagged(region, roboticsDomain, empowermentMechanism, emotionalTag);
    }
}
