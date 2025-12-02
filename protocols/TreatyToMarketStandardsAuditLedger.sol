// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToMarketStandardsAuditLedger {
    string public batchID = "1321.9.228";
    string public steward = "Vinvin";

    address public admin;

    struct Standard {
        string category;    // food safety, electronics compliance, toy standards
        string status;      // audited, pending, ghost
        uint256 timestamp;
    }

    Standard[] public standards;

    event StandardLogged(string category, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logStandard(string memory category, string memory status) public onlyAdmin {
        standards.push(Standard(category, status, block.timestamp));
        emit StandardLogged(category, status);
    }

    function getStandard(uint256 index) public view returns (string memory category, string memory status, uint256 timestamp) {
        Standard memory s = standards[index];
        return (s.category, s.status, s.timestamp);
    }
}
