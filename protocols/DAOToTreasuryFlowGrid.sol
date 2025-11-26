// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToTreasuryFlowGrid {
    string public batchID = "1321.9.134";
    string public steward = "Vinvin";

    address public admin;

    struct TreasuryFlow {
        string company;
        uint256 inflow;
        uint256 outflow;
        uint256 balance;
        uint256 timestamp;
    }

    TreasuryFlow[] public flows;

    event TreasuryLogged(string company, uint256 inflow, uint256 outflow, uint256 balance);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logTreasury(string memory company, uint256 inflow, uint256 outflow, uint256 balance) public onlyAdmin {
        flows.push(TreasuryFlow(company, inflow, outflow, balance, block.timestamp));
        emit TreasuryLogged(company, inflow, outflow, balance);
    }

    function getTreasury(uint256 index) public view returns (string memory company, uint256 inflow, uint256 outflow, uint256 balance, uint256 timestamp) {
        TreasuryFlow memory t = flows[index];
        return (t.company, t.inflow, t.outflow, t.balance, t.timestamp);
    }
}
