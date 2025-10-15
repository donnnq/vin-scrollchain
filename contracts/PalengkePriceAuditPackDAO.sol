// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PalengkePriceAuditPackDAO {
    address public admin;

    struct AuditEntry {
        string marketName;
        string commodity;
        uint256 retailPrice;
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

    function submitAudit(string memory _marketName, string memory _commodity, uint256 _retailPrice, string memory _emotionalTag) external onlyAdmin {
        audits.push(AuditEntry(_marketName, _commodity, _retailPrice, _emotionalTag, false));
    }

    function verifyAudit(uint256 index) external onlyAdmin {
        audits[index].verified = true;
    }

    function getAudit(uint256 index) external view returns (AuditEntry memory) {
        return audits[index];
    }
}
