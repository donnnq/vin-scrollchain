// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WorkerToEmployerTrustTreaty {
    address public steward;

    struct TrustClause {
        string workerName;
        string employerName;
        string trustVerdict;
        string emotionalTag;
    }

    TrustClause[] public treatyLog;

    event TrustEquityTagged(string workerName, string employerName, string trustVerdict, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagTrustEquity(
        string memory workerName,
        string memory employerName,
        string memory trustVerdict,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(TrustClause(workerName, employerName, trustVerdict, emotionalTag));
        emit TrustEquityTagged(workerName, employerName, trustVerdict, emotionalTag);
    }
}
