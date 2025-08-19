// SPDX-License-Identifier: Mythic-Reform
pragma solidity ^0.8.19;

contract vinCryptoReformSuite {
    address public steward;

    struct ReformEntry {
        string projectName;
        uint256 penaltyAmount;
        string reformPlan;
        bool approved;
    }

    ReformEntry[] public submissions;

    event ReformSubmitted(string projectName, uint256 penaltyAmount);
    event ReformApproved(string projectName);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized scroll access");
        _;
    }

    function submitReform(string memory _projectName, uint256 _penaltyAmount, string memory _reformPlan) public {
        submissions.push(ReformEntry(_projectName, _penaltyAmount, _reformPlan, false));
        emit ReformSubmitted(_projectName, _penaltyAmount);
    }

    function approveReform(uint256 index) public onlySteward {
        submissions[index].approved = true;
        emit ReformApproved(submissions[index].projectName);
    }

    function getReform(uint256 index) public view returns (ReformEntry memory) {
        return submissions[index];
    }
}
