// SPDX-License-Identifier: CIVIC-VERDICT-MECHANICS
pragma solidity ^0.8.19;

contract vinCivicVerdictEngine {
    address public senateClerk;
    uint public trialCount;
    uint public requiredVotes = 15;

    enum Verdict { Pending, Acquitted, Removed }

    struct Trial {
        string respondent;
        uint yesVotes;
        uint noVotes;
        Verdict outcome;
        bool isFinal;
    }

    mapping(uint => Trial) public trials;

    event TrialInitiated(uint trialId, string respondent);
    event VoteCast(uint trialId, bool inFavor, address senator);
    event VerdictIssued(uint trialId, Verdict result);

    modifier onlyClerk() {
        require(msg.sender == senateClerk, "Clerk access required");
        _;
    }

    constructor() {
        senateClerk = msg.sender;
    }

    function initiateTrial(string calldata respondent) external onlyClerk returns (uint) {
        trialCount++;
        trials[trialCount] = Trial(respondent, 0, 0, Verdict.Pending, false);
        emit TrialInitiated(trialCount, respondent);
        return trialCount;
    }

    function castVote(uint trialId, bool inFavor) external {
        Trial storage t = trials[trialId];
        require(!t.isFinal, "Trial concluded");
        if (inFavor) {
            t.yesVotes++;
        } else {
            t.noVotes++;
        }
        emit VoteCast(trialId, inFavor, msg.sender);
        if (t.yesVotes + t.noVotes >= requiredVotes) {
            finalizeVerdict(trialId);
        }
    }

    function finalizeVerdict(uint trialId) internal {
        Trial storage t = trials[trialId];
        t.isFinal = true;
        t.outcome = t.yesVotes > t.noVotes ? Verdict.Removed : Verdict.Acquitted;
        emit VerdictIssued(trialId, t.outcome);
    }

    function getTrialStatus(uint trialId) external view returns (Trial memory) {
        return trials[trialId];
    }
}
