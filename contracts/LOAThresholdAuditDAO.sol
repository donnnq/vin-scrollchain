// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract LOAThresholdAuditDAO {
    address public originator;

    struct LOAChange {
        string roleTag;
        uint256 oldThreshold;
        uint256 newThreshold;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    LOAChange[] public auditLedger;

    constructor() {
        originator = msg.sender;
    }

    function logLOAChange(
        string memory roleTag,
        uint256 oldThreshold,
        uint256 newThreshold,
        bool isScrollchainSealed
    ) external {
        auditLedger.push(LOAChange({
            roleTag: roleTag,
            oldThreshold: oldThreshold,
            newThreshold: newThreshold,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
