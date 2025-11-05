// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RescueStewardshipKarmaCodex {
    address public steward;

    struct KarmaClause {
        string stewardName;
        string rescueAct;
        string karmaSignal;
        string emotionalTag;
    }

    KarmaClause[] public codex;

    event StewardshipKarmaTagged(string stewardName, string rescueAct, string karmaSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagKarma(
        string memory stewardName,
        string memory rescueAct,
        string memory karmaSignal,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(KarmaClause(stewardName, rescueAct, karmaSignal, emotionalTag));
        emit StewardshipKarmaTagged(stewardName, rescueAct, karmaSignal, emotionalTag);
    }
}
