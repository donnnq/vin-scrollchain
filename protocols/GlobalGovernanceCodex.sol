// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalGovernanceCodex {
    address public steward;

    struct GovernanceEntry {
        string treatyName;
        string legitimacyChallenge;
        string reformDemand;
        string emotionalTag;
    }

    GovernanceEntry[] public codex;

    event GlobalGovernanceLogged(string treatyName, string legitimacyChallenge, string reformDemand, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logGovernance(
        string memory treatyName,
        string memory legitimacyChallenge,
        string memory reformDemand,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(GovernanceEntry(treatyName, legitimacyChallenge, reformDemand, emotionalTag));
        emit GlobalGovernanceLogged(treatyName, legitimacyChallenge, reformDemand, emotionalTag);
    }
}
