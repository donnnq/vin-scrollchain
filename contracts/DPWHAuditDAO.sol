// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DPWHAuditDAO {
    address public originator;

    struct AuditSignal {
        string projectName;
        string district;
        uint256 allocatedBudget;
        bool isScrollchainSealed;
        string anomalyFlag;
        uint256 timestamp;
    }

    AuditSignal[] public auditLedger;

    constructor() {
        originator = msg.sender;
    }

    function logAuditSignal(
        string memory projectName,
        string memory district,
        uint256 allocatedBudget,
        bool isScrollchainSealed,
        string memory anomalyFlag
    ) external {
        auditLedger.push(AuditSignal({
            projectName: projectName,
            district: district,
            allocatedBudget: allocatedBudget,
            isScrollchainSealed: isScrollchainSealed,
            anomalyFlag: anomalyFlag,
            timestamp: block.timestamp
        }));
    }
}
