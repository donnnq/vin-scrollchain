// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToBudgetAuditGrid {
    string public batchID = "1321.9.186";
    string public steward = "Vinvin";

    address public admin;

    struct BudgetAudit {
        string project;     // flood control, road, school
        uint256 amount;     // allocated budget
        string status;      // verified, ghost, pending
        uint256 timestamp;
    }

    BudgetAudit[] public audits;

    event AuditLogged(string project, uint256 amount, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logAudit(string memory project, uint256 amount, string memory status) public onlyAdmin {
        audits.push(BudgetAudit(project, amount, status, block.timestamp));
        emit AuditLogged(project, amount, status);
    }

    function getAudit(uint256 index) public view returns (string memory project, uint256 amount, string memory status, uint256 timestamp) {
        BudgetAudit memory b = audits[index];
        return (b.project, b.amount, b.status, b.timestamp);
    }
}
