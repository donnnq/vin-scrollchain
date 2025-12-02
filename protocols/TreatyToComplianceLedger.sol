// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToComplianceLedger {
    string public batchID = "1321.9.232";
    string public steward = "Vinvin";

    address public admin;

    struct Compliance {
        string regulation;   // tax law, safety code, environmental rule
        string status;       // audited, pending, ghost
        uint256 timestamp;
    }

    Compliance[] public compliances;

    event ComplianceLogged(string regulation, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logCompliance(string memory regulation, string memory status) public onlyAdmin {
        compliances.push(Compliance(regulation, status, block.timestamp));
        emit ComplianceLogged(regulation, status);
    }

    function getCompliance(uint256 index) public view returns (string memory regulation, string memory status, uint256 timestamp) {
        Compliance memory c = compliances[index];
        return (c.regulation, c.status, c.timestamp);
    }
}
