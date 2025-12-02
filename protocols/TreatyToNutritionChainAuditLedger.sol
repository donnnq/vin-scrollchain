// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToNutritionChainAuditLedger {
    string public batchID = "1321.9.238";
    string public steward = "Vinvin";

    address public admin;

    struct NutritionChain {
        string product;     // rice, fish, dairy
        string status;      // audited, pending, ghost
        uint256 timestamp;
    }

    NutritionChain[] public chains;

    event NutritionChainLogged(string product, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logChain(string memory product, string memory status) public onlyAdmin {
        chains.push(NutritionChain(product, status, block.timestamp));
        emit NutritionChainLogged(product, status);
    }

    function getChain(uint256 index) public view returns (string memory product, string memory status, uint256 timestamp) {
        NutritionChain memory n = chains[index];
        return (n.product, n.status, n.timestamp);
    }
}
