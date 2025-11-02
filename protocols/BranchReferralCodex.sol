// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BranchReferralCodex {
    address public steward;

    struct ReferralClause {
        string workerName;
        string originalBranch;
        string referredBranch;
        string emotionalTag;
    }

    ReferralClause[] public codex;

    event BranchReferralLogged(string workerName, string originalBranch, string referredBranch, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logBranchReferral(
        string memory workerName,
        string memory originalBranch,
        string memory referredBranch,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ReferralClause(workerName, originalBranch, referredBranch, emotionalTag));
        emit BranchReferralLogged(workerName, originalBranch, referredBranch, emotionalTag);
    }
}
