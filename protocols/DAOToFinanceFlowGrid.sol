// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToFinanceFlowGrid {
    string public batchID = "1321.9.141";
    string public steward = "Vinvin";

    address public admin;

    struct FinanceFlow {
        string institution; // bank, payment rail, exchange
        uint256 liquidity;
        uint256 trustScore;
        uint256 timestamp;
    }

    FinanceFlow[] public flows;

    event FinanceLogged(string institution, uint256 liquidity, uint256 trustScore);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logFinance(string memory institution, uint256 liquidity, uint256 trustScore) public onlyAdmin {
        flows.push(FinanceFlow(institution, liquidity, trustScore, block.timestamp));
        emit FinanceLogged(institution, liquidity, trustScore);
    }

    function getFinance(uint256 index) public view returns (string memory institution, uint256 liquidity, uint256 trustScore, uint256 timestamp) {
        FinanceFlow memory f = flows[index];
        return (f.institution, f.liquidity, f.trustScore, f.timestamp);
    }
}
