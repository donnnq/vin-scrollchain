// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinCompassionGuard {
    struct Participant {
        bool flagged;
        bool improving;
        bool memeDetected;
        uint256 trustScore;
    }

    mapping(address => Participant) public ledger;

    modifier notJudging(address _user) {
        require(ledger[_user].trustScore >= 0, "Compassion active. No aggression triggered.");
        _;
    }

    function recordAction(address _user, string memory actionType, bool positiveIntent) public {
        Participant storage p = ledger[_user];

        if (keccak256(bytes(actionType)) == keccak256("meme") && positiveIntent) {
            p.memeDetected = true;
            p.trustScore += 1;
        }

        if (positiveIntent) {
            p.improving = true;
            p.trustScore += 2;
        }
    }

    function getStatus(address _user) public view returns (string memory) {
        Participant memory p = ledger[_user];

        if (p.improving && !p.flagged) {
            return "Observed with compassion. Showing signs of growth.";
        } else if (p.memeDetected) {
            return "Humor detected. No aggression protocol activated.";
        } else if (p.flagged) {
            return "Flag exists. Observation only. No legal trigger.";
        }

        return "Neutral. Privacy respected.";
    }
}
