// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract AttitudeProof {
    address public scrollsmith;

    struct Candidate {
        string name;
        bool respectful;
        bool committed;
        bool verified;
    }

    mapping(address => Candidate) public candidates;

    event CandidateSubmitted(address indexed candidate, string name);
    event AttitudeVerified(address indexed candidate);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not scrollsmith");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    function submitCandidate(address candidate, string calldata name, bool respectful, bool committed) external onlyScrollsmith {
        candidates[candidate] = Candidate(name, respectful, committed, false);
        emit CandidateSubmitted(candidate, name);
    }

    function verifyAttitude(address candidate) external onlyScrollsmith {
        require(candidates[candidate].respectful && candidates[candidate].committed, "Attitude not sufficient");
        candidates[candidate].verified = true;
        emit AttitudeVerified(candidate);
    }

    function isVerified(address candidate) external view returns (bool) {
        return candidates[candidate].verified;
    }
}
