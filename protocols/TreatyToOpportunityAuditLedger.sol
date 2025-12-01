// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToOpportunityAuditLedger {
    string public batchID = "1321.9.213";
    string public steward = "Vinvin";

    address public admin;

    struct Opportunity {
        string sector;      // education, employment, training
        string status;      // equitable, pending, ghost
        uint256 timestamp;
    }

    Opportunity[] public opportunities;

    event OpportunityLogged(string sector, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logOpportunity(string memory sector, string memory status) public onlyAdmin {
        opportunities.push(Opportunity(sector, status, block.timestamp));
        emit OpportunityLogged(sector, status);
    }

    function getOpportunity(uint256 index) public view returns (string memory sector, string memory status, uint256 timestamp) {
        Opportunity memory o = opportunities[index];
        return (o.sector, o.status, o.timestamp);
    }
}
