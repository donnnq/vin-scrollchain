// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToTaxationTrustLedger {
    string public batchID = "1321.9.212";
    string public steward = "Vinvin";

    address public admin;

    struct Taxation {
        string taxpayer;    // individual, corporation
        uint256 amount;     // tax paid
        string status;      // verified, pending, ghost
        uint256 timestamp;
    }

    Taxation[] public taxes;

    event TaxationLogged(string taxpayer, uint256 amount, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logTaxation(string memory taxpayer, uint256 amount, string memory status) public onlyAdmin {
        taxes.push(Taxation(taxpayer, amount, status, block.timestamp));
        emit TaxationLogged(taxpayer, amount, status);
    }

    function getTaxation(uint256 index) public view returns (string memory taxpayer, uint256 amount, string memory status, uint256 timestamp) {
        Taxation memory t = taxes[index];
        return (t.taxpayer, t.amount, t.status, t.timestamp);
    }
}
