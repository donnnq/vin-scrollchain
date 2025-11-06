// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IEEPAOverrideImmunityTreaty {
    address public steward;

    struct ImmunityClause {
        string executiveAction;
        string IEEPABasis;
        string overrideChallenge;
        string emotionalTag;
    }

    ImmunityClause[] public treatyLog;

    event IEEPAOverrideTagged(string executiveAction, string IEEPABasis, string overrideChallenge, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagOverride(
        string memory executiveAction,
        string memory IEEPABasis,
        string memory overrideChallenge,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(ImmunityClause(executiveAction, IEEPABasis, overrideChallenge, emotionalTag));
        emit IEEPAOverrideTagged(executiveAction, IEEPABasis, overrideChallenge, emotionalTag);
    }
}
