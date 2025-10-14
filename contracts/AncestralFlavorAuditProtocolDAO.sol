// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AncestralFlavorAuditProtocolDAO {
    address public admin;

    struct Audit {
        string dish;
        string ancestralOrigin;
        string auditVerdict;
        bool verified;
    }

    Audit[] public audits;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitAudit(string memory _dish, string memory _ancestralOrigin, string memory _auditVerdict) external onlyAdmin {
        audits.push(Audit(_dish, _ancestralOrigin, _auditVerdict, true));
    }

    function getAudit(uint256 index) external view returns (Audit memory) {
        return audits[index];
    }
}
