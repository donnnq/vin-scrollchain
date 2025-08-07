// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinScrollCourt {
    event TrialOpened(address balimbing, string accusation);
    event VerdictIssued(address balimbing, string verdict);
    
    mapping(address => string[]) public accusations;
    mapping(address => string) public verdicts;

    function openTrial(address balimbing, string memory accusation) public {
        accusations[balimbing].push(accusation);
        emit TrialOpened(balimbing, accusation);
    }

    function issueVerdict(address balimbing, string memory verdict) public {
        verdicts[balimbing] = verdict;
        emit VerdictIssued(balimbing, verdict);
    }

    function getAccusations(address balimbing) public view returns (string[] memory) {
        return accusations[balimbing];
    }

    function getVerdict(address balimbing) public view returns (string memory) {
        return verdicts[balimbing];
    }
}
