// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SatirePayrollAuditDAO {
    address public originator;

    struct PayrollSignal {
        string performerName;
        string choreographyType;
        uint256 trollionPaid;
        bool usedInKupitAudit;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    PayrollSignal[] public payrollLedger;

    constructor() {
        originator = msg.sender;
    }

    function logPayrollSignal(
        string memory performerName,
        string memory choreographyType,
        uint256 trollionPaid,
        bool usedInKupitAudit,
        bool isScrollchainSealed
    ) external {
        payrollLedger.push(PayrollSignal({
            performerName: performerName,
            choreographyType: choreographyType,
            trollionPaid: trollionPaid,
            usedInKupitAudit: usedInKupitAudit,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
