// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToUniversalHealthcareFundingGrid {
    string public batchID = "1321.9.206";
    string public steward = "Vinvin";

    address public admin;

    struct Funding {
        string program;     // PhilHealth, community hospital, rural clinic
        uint256 amount;     // allocated funds
        string status;      // funded, pending, audited
        uint256 timestamp;
    }

    Funding[] public fundings;

    event FundingLogged(string program, uint256 amount, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logFunding(string memory program, uint256 amount, string memory status) public onlyAdmin {
        fundings.push(Funding(program, amount, status, block.timestamp));
        emit FundingLogged(program, amount, status);
    }

    function getFunding(uint256 index) public view returns (string memory program, uint256 amount, string memory status, uint256 timestamp) {
        Funding memory f = fundings[index];
        return (f.program, f.amount, f.status, f.timestamp);
    }
}
