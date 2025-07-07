// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollTrial {
    enum TrialType { Oath, Role, Scroll }
    enum Verdict { Pending, Passed, Failed }

    struct Trial {
        string name;
        TrialType trialType;
        address subject;
        string challenge;
        Verdict verdict;
        uint256 initiatedAt;
        uint256 resolvedAt;
    }

    Trial[] public trials;
    address public immutable trialmaster;

    event TrialInitiated(uint256 indexed id, string name, address subject, string challenge, TrialType trialType, uint256 timestamp);
    event TrialResolved(uint256 indexed id, Verdict verdict, uint256 timestamp);

    modifier onlyMaster() {
        require(msg.sender == trialmaster, "Not the trialmaster");
        _;
    }

    constructor() {
        trialmaster = msg.sender;
    }

    function initiateTrial(
        string calldata name,
        TrialType trialType,
        address subject,
        string calldata challenge
    ) external onlyMaster {
        trials.push(Trial({
            name: name,
            trialType: trialType,
            subject: subject,
            challenge: challenge,
            verdict: Verdict.Pending,
            initiatedAt: block.timestamp,
            resolvedAt: 0
        }));

        emit TrialInitiated(trials.length - 1, name, subject, challenge, trialType, block.timestamp);
    }

    function resolveTrial(uint256 id, Verdict verdict) external onlyMaster {
        require(id < trials.length, "Invalid trial ID");
        require(trials[id].verdict == Verdict.Pending, "Trial already resolved");

        trials[id].verdict = verdict;
        trials[id].resolvedAt = block.timestamp;

        emit TrialResolved(id, verdict, block.timestamp);
    }

    function getTrial(uint256 id) external view returns (Trial memory) {
        require(id < trials.length, "Invalid trial ID");
        return trials[id];
    }

    function totalTrials() external view returns (uint256) {
        return trials.length;
    }
}
