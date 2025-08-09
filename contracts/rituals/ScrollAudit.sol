// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ScrollAudit {
    address public scrollsmith;

    struct Audit {
        string target; // e.g., "Dorm 3", "Canteen A"
        uint256 score; // 1–5
        string comment;
    }

    Audit[] public audits;

    event AuditSubmitted(string target, uint256 score, string comment);
    event UpgradeTriggered(string target);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not scrollsmith");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    function submitAudit(string calldata target, uint256 score, string calldata comment) external {
        require(score >= 1 && score <= 5, "Score must be 1–5");
        audits.push(Audit(target, score, comment));
        emit AuditSubmitted(target, score, comment);

        if (score <= 2) {
            emit UpgradeTriggered(target); // symbolic trigger
        }
    }

    function getAllAudits() external view returns (Audit[] memory) {
        return audits;
    }
}
