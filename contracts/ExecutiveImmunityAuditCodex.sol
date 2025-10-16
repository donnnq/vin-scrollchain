// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExecutiveImmunityAuditCodex {
    address public admin;

    struct ImmunityAudit {
        string officialLabel;
        string protectionType;
        string emotionalTag;
        bool breached;
        bool archived;
    }

    ImmunityAudit[] public audits;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitAudit(string memory officialLabel, string memory protectionType, string memory emotionalTag) external onlyAdmin {
        audits.push(ImmunityAudit(officialLabel, protectionType, emotionalTag, false, false));
    }

    function breachAudit(uint256 index) external onlyAdmin {
        audits[index].breached = true;
    }

    function archiveAudit(uint256 index) external onlyAdmin {
        audits[index].archived = true;
    }

    function getAudit(uint256 index) external view returns (ImmunityAudit memory) {
        return audits[index];
    }
}
