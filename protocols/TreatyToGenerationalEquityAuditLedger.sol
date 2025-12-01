// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToGenerationalEquityAuditLedger {
    string public batchID = "1321.9.222";
    string public steward = "Vinvin";

    address public admin;

    struct Equity {
        string sector;      // education, employment, climate
        string status;      // equitable, pending, ghost
        uint256 timestamp;
    }

    Equity[] public equities;

    event EquityLogged(string sector, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logEquity(string memory sector, string memory status) public onlyAdmin {
        equities.push(Equity(sector, status, block.timestamp));
        emit EquityLogged(sector, status);
    }

    function getEquity(uint256 index) public view returns (string memory sector, string memory status, uint256 timestamp) {
        Equity memory e = equities[index];
        return (e.sector, e.status, e.timestamp);
    }
}
