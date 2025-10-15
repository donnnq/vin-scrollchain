// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConvenienceFeeAuditPackDAO {
    address public admin;

    struct AuditEntry {
        string transactionType;
        uint256 flatFee;
        uint256 percentageFee;
        string emotionalTag;
        bool verified;
    }

    AuditEntry[] public audits;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitAudit(string memory _transactionType, uint256 _flatFee, uint256 _percentageFee, string memory _emotionalTag) external onlyAdmin {
        audits.push(AuditEntry(_transactionType, _flatFee, _percentageFee, _emotionalTag, false));
    }

    function verifyAudit(uint256 index) external onlyAdmin {
        audits[index].verified = true;
    }

    function getAudit(uint256 index) external view returns (AuditEntry memory) {
        return audits[index];
    }
}
