// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TariffImpactAuditProtocolDAO {
    address public admin;

    struct TariffAudit {
        string category;
        uint256 tariffPercent;
        string sourceCountry;
        string impactSummary;
    }

    TariffAudit[] public audits;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logAudit(string memory _category, uint256 _tariffPercent, string memory _sourceCountry, string memory _impactSummary) external onlyAdmin {
        audits.push(TariffAudit(_category, _tariffPercent, _sourceCountry, _impactSummary));
    }

    function getAudit(uint256 index) external view returns (TariffAudit memory) {
        return audits[index];
    }
}
