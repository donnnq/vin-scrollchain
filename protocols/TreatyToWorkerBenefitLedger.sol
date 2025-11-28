// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToWorkerBenefitLedger {
    string public batchID = "1321.9.169";
    string public steward = "Vinvin";

    address public admin;

    struct Benefit {
        string typeOfBenefit; // 13th month, overtime, SSS, PhilHealth
        string company;
        string status;        // compliant, unpaid, delayed
        uint256 timestamp;
    }

    Benefit[] public benefits;

    event BenefitLogged(string typeOfBenefit, string company, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logBenefit(string memory typeOfBenefit, string memory company, string memory status) public onlyAdmin {
        benefits.push(Benefit(typeOfBenefit, company, status, block.timestamp));
        emit BenefitLogged(typeOfBenefit, company, status);
    }

    function getBenefit(uint256 index) public view returns (string memory typeOfBenefit, string memory company, string memory status, uint256 timestamp) {
        Benefit memory b = benefits[index];
        return (b.typeOfBenefit, b.company, b.status, b.timestamp);
    }
}
