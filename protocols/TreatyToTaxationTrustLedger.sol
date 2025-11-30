// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToTaxationTrustLedger {
    string public batchID = "1321.9.199";
    string public steward = "Vinvin";

    address public admin;

    struct TaxRecord {
        string taxpayer;    // individual, company
        uint256 amount;     // tax paid
        string status;      // verified, pending, disputed
        uint256 timestamp;
    }

    TaxRecord[] public taxes;

    event TaxLogged(string taxpayer, uint256 amount, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logTax(string memory taxpayer, uint256 amount, string memory status) public onlyAdmin {
        taxes.push(TaxRecord(taxpayer, amount, status, block.timestamp));
        emit TaxLogged(taxpayer, amount, status);
    }

    function getTax(uint256 index) public view returns (string memory taxpayer, uint256 amount, string memory status, uint256 timestamp) {
        TaxRecord memory t = taxes[index];
        return (t.taxpayer, t.amount, t.status, t.timestamp);
    }
}
