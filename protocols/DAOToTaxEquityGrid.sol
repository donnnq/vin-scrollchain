// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToTaxEquityGrid {
    string public batchID = "1321.9.221";
    string public steward = "Vinvin";

    address public admin;

    struct Tax {
        string taxpayer;    // individual, corporation
        uint256 amount;     // tax paid
        string status;      // equitable, pending, ghost
        uint256 timestamp;
    }

    Tax[] public taxes;

    event TaxLogged(string taxpayer, uint256 amount, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logTax(string memory taxpayer, uint256 amount, string memory status) public onlyAdmin {
        taxes.push(Tax(taxpayer, amount, status, block.timestamp));
        emit TaxLogged(taxpayer, amount, status);
    }

    function getTax(uint256 index) public view returns (string memory taxpayer, uint256 amount, string memory status, uint256 timestamp) {
        Tax memory t = taxes[index];
        return (t.taxpayer, t.amount, t.status, t.timestamp);
    }
}
