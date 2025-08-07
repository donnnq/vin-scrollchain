// SPDX-License-Identifier: CIVIC-TRIAL-SUITE
pragma solidity ^0.8.19;

contract vinCivicTrialSuite {
    enum Verdict { Pending, Acquitted, Removed }

    struct Trial {
        string respondent;
        uint yesVotes;
        uint noVotes;
        Verdict outcome;
        bool isFinal;
        uint timestamp;
    }

    address public clerk;
    uint public requiredVotes = 15;
    uint public trialCount;

    mapping(uint => Trial) public trials;
    mapping(address => string) public badgeAlignment;
    mapping(uint => uint) public publicSentiment;
    mapping(uint => bool) public isDivergent;

    Trial[] public archives;

    event TrialStarted(uint trialId, string respondent);
    event Voted(uint trialId, bool inFavor, address senator, string alignment);
    event VerdictFinalized(uint trialId, Verdict outcome);
    event SentimentLogged(uint trialId, uint score, bool divergent);
    event TrialArchived(string respondent, Verdict outcome, uint timestamp);

    modifier onlyClerk() {
        require(msg.sender == clerk, "Only clerk can perform this");
        _;
    }

    constructor() {
        clerk = msg.sender;
    }

    function assignBadge(address senator, string calldata alignment) external onlyClerk {
        badgeAlignment[senator] = alignment;
    }

    function startTrial(string calldata respondent) external onlyClerk returns (uint) {
        trialCount++;
        trials[trialCount] = Trial(respondent, 0, 0, Verdict.Pending, false, block.timestamp);
        emit TrialStarted(trialCount, respondent);
        return trialCount;
    }

    function castVote(uint trialId, bool inFavor) external {
        Trial storage t = trials[trialId];
        require(!t.isFinal, "Trial already concluded");

        if (inFavor) {
            t.yesVotes++;
        } else {
            t.noVotes++;
        }

        emit Voted(trialId, inFavor, msg.sender, badgeAlignment[msg.sender]);

        if (t.yesVotes + t.noVotes >= requiredVotes) {
            finalizeVerdict(trialId);
        }
    }

    function finalizeVerdict(uint trialId) internal {
        Trial storage t = trials[trialId];
        t.isFinal = true;
        t.outcome = t.yesVotes > t.noVotes ? Verdict.Removed : Verdict.Acquitted;
        emit VerdictFinalized(trialId, t.outcome);
        archiveTrial(trialId);
    }

    function logSentiment(uint trialId, uint score) external onlyClerk {
        publicSentiment[trialId] = score;
        bool divergent = score < 50;
        isDivergent[trialId] = divergent;
        emit SentimentLogged(trialId, score, divergent);
    }

    function archiveTrial(uint trialId) internal {
        Trial memory t = trials[trialId];
        archives.push(t);
        emit TrialArchived(t.respondent, t.outcome, block.timestamp);
    }

    function getTrial(uint trialId) external view returns (Trial memory) {
        return trials[trialId];
    }

    function getArchivesCount() external view returns (uint) {
        return archives.length;
    }

    function getArchive(uint index) external view returns (Trial memory) {
        require(index < archives.length, "Out of bounds");
        return archives[index];
    }
}
