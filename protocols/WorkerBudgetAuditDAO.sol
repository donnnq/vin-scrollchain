// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract WorkerBudgetAuditDAO {
    address public validator;

    struct Budget {
        address worker;
        uint256 income;
        uint256 expenses;
        bool deficit;
        uint256 timestamp;
    }

    Budget[] public audits;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function submitAudit(address _worker, uint256 _income, uint256 _expenses) public onlyValidator {
        bool _deficit = _income < _expenses;
        audits.push(Budget(_worker, _income, _expenses, _deficit, block.timestamp));
    }

    function getAudit(uint256 index) public view returns (Budget memory) {
        return audits[index];
    }

    function totalAudits() public view returns (uint256) {
        return audits.length;
    }
}
