// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CompassionSovereigntyCodex {
    address public steward;

    struct SovereigntyClause {
        string actOfCompassion;
        string civicDomain;
        string sovereigntySignal;
        string emotionalTag;
    }

    SovereigntyClause[] public codex;

    event CompassionSovereigntyTagged(string actOfCompassion, string civicDomain, string sovereigntySignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagCompassion(
        string memory actOfCompassion,
        string memory civicDomain,
        string memory sovereigntySignal,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(SovereigntyClause(actOfCompassion, civicDomain, sovereigntySignal, emotionalTag));
        emit CompassionSovereigntyTagged(actOfCompassion, civicDomain, sovereigntySignal, emotionalTag);
    }
}
