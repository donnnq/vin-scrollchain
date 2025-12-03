// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToSafetyStandardsAuditLedger {
    string public batchID = "1321.9.240";
    string public steward = "Vinvin";

    address public admin;

    struct SafetyStandard {
        string regulation;   // FDA, ISO, consumer law
        string status;       // audited, pending, ghost
        uint256 timestamp;
    }

    SafetyStandard[] public standards;

    event SafetyStandardLogged(string regulation, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logStandard(string memory regulation, string memory status) public onlyAdmin {
        standards.push(SafetyStandard(regulation, status, block.timestamp));
        emit SafetyStandardLogged(regulation, status);
    }

    function getStandard(uint256 index) public view returns (string memory regulation, string memory status, uint256 timestamp) {
        SafetyStandard memory s = standards[index];
        return (s.regulation, s.status, s.timestamp);
    }
}
