// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicHousingAuditProtocolDAO {
    address public admin;

    struct Audit {
        string city;
        string developer;
        uint256 unitsInspected;
        bool passed;
    }

    Audit[] public audits;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitAudit(string memory _city, string memory _developer, uint256 _unitsInspected, bool _passed) external onlyAdmin {
        audits.push(Audit(_city, _developer, _unitsInspected, _passed));
    }

    function getAudit(uint256 index) external view returns (Audit memory) {
        return audits[index];
    }
}
