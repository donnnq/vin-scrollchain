// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinCareCreditMirror {
    struct CreditLog {
        string item;
        uint256 amount;
        string recipientType;
        uint256 timestamp;
    }

    CreditLog[] public logs;
    event CreditIssued(string item, uint256 amount, string recipientType);

    function issueCredit(string calldata item, uint256 amount, string calldata recipientType) external {
        logs.push(CreditLog(item, amount, recipientType, block.timestamp));
        emit CreditIssued(item, amount, recipientType);
    }

    function getAllCredits() external view returns (CreditLog[] memory) {
        return logs;
    }
}
