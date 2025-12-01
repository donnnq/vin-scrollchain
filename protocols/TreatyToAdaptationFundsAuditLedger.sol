// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToAdaptationFundsAuditLedger {
    string public batchID = "1321.9.214";
    string public steward = "Vinvin";

    address public admin;

    struct Fund {
        string project;     // flood control, reforestation, renewable energy
        uint256 amount;     // allocated funds
        string status;      // released, pending, audited
        uint256 timestamp;
    }

    Fund[] public funds;

    event FundLogged(string project, uint256 amount, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logFund(string memory project, uint256 amount, string memory status) public onlyAdmin {
        funds.push(Fund(project, amount, status, block.timestamp));
        emit FundLogged(project, amount, status);
    }

    function getFund(uint256 index) public view returns (string memory project, uint256 amount, string memory status, uint256 timestamp) {
        Fund memory f = funds[index];
        return (f.project, f.amount, f.status, f.timestamp);
    }
}
