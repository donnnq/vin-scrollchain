// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToPublicExpenditureAuditLedger {
    string public batchID = "1321.9.230";
    string public steward = "Vinvin";

    address public admin;

    struct Expenditure {
        string project;     // infrastructure, social welfare, climate adaptation
        uint256 amount;
        string status;      // audited, pending, ghost
        uint256 timestamp;
    }

    Expenditure[] public expenditures;

    event ExpenditureLogged(string project, uint256 amount, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logExpenditure(string memory project, uint256 amount, string memory status) public onlyAdmin {
        expenditures.push(Expenditure(project, amount, status, block.timestamp));
        emit ExpenditureLogged(project, amount, status);
    }

    function getExpenditure(uint256 index) public view returns (string memory project, uint256 amount, string memory status, uint256 timestamp) {
        Expenditure memory e = expenditures[index];
        return (e.project, e.amount, e.status, e.timestamp);
    }
}
