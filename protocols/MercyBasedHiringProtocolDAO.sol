// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MercyBasedHiringProtocolDAO {
    address public validator;

    struct Applicant {
        address candidate;
        string role;
        uint8 sincerityScore;
        bool hired;
        uint256 timestamp;
    }

    Applicant[] public applicants;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function evaluateCandidate(address _candidate, string memory _role, uint8 _score) public onlyValidator {
        bool _hired = _score >= 75;
        applicants.push(Applicant(_candidate, _role, _score, _hired, block.timestamp));
    }

    function getApplicant(uint256 index) public view returns (Applicant memory) {
        return applicants[index];
    }

    function totalApplicants() public view returns (uint256) {
        return applicants.length;
    }
}
