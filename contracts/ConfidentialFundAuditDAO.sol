// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConfidentialFundAuditDAO {
    address public admin;

    struct FundAudit {
        string agency;
        uint256 amount;
        string purpose;
        bool verified;
        bool flagged;
    }

    FundAudit[] public audits;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitAudit(string memory _agency, uint256 _amount, string memory _purpose) external onlyAdmin {
        audits.push(FundAudit(_agency, _amount, _purpose, false, false));
    }

    function verifyAudit(uint256 index) external onlyAdmin {
        audits[index].verified = true;
    }

    function flagAudit(uint256 index) external onlyAdmin {
        audits[index].flagged = true;
    }

    function getAudit(uint256 index) external view returns (FundAudit memory) {
        return audits[index];
    }
}
