// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToRecruitmentIncentiveLedger {
    string public batchID = "1321.9.164";
    string public steward = "Vinvin";

    address public admin;

    struct Incentive {
        string typeOfIncentive; // bonus, training, conversion guarantee
        string target;          // agency, company, employee
        uint256 timestamp;
    }

    Incentive[] public incentives;

    event IncentiveLogged(string typeOfIncentive, string target);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logIncentive(string memory typeOfIncentive, string memory target) public onlyAdmin {
        incentives.push(Incentive(typeOfIncentive, target, block.timestamp));
        emit IncentiveLogged(typeOfIncentive, target);
    }

    function getIncentive(uint256 index) public view returns (string memory typeOfIncentive, string memory target, uint256 timestamp) {
        Incentive memory i = incentives[index];
        return (i.typeOfIncentive, i.target, i.timestamp);
    }
}
