// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToSubsidyAuditLedger {
    string public batchID = "1321.9.207";
    string public steward = "Vinvin";

    address public admin;

    struct Subsidy {
        string sector;      // agriculture, transport, energy
        uint256 amount;     // subsidy value
        string status;      // released, pending, audited
        uint256 timestamp;
    }

    Subsidy[] public subsidies;

    event SubsidyLogged(string sector, uint256 amount, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logSubsidy(string memory sector, uint256 amount, string memory status) public onlyAdmin {
        subsidies.push(Subsidy(sector, amount, status, block.timestamp));
        emit SubsidyLogged(sector, amount, status);
    }

    function getSubsidy(uint256 index) public view returns (string memory sector, uint256 amount, string memory status, uint256 timestamp) {
        Subsidy memory s = subsidies[index];
        return (s.sector, s.amount, s.status, s.timestamp);
    }
}
