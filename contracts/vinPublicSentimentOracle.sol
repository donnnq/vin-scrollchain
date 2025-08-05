// SPDX-License-Identifier: PUBLIC-SENTIMENT-ORACLE
pragma solidity ^0.8.19;

contract vinPublicSentimentOracle {
    mapping(uint => uint) public civicApprovalScore;
    mapping(uint => bool) public isDivergent;
    event SentimentLogged(uint trialId, uint score, bool divergent);

    function logSentiment(uint trialId, uint score) external {
        civicApprovalScore[trialId] = score;
        isDivergent[trialId] = score < 50;
        emit SentimentLogged(trialId, score, score < 50);
    }

    function checkDivergence(uint trialId) external view returns (bool) {
        return isDivergent[trialId];
    }
}
