// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToSupplyChainAuditLedger {
    string public batchID = "1321.9.227";
    string public steward = "Vinvin";

    address public admin;

    struct SupplyChain {
        string product;     // rice, vegetables, fish
        string status;      // audited, pending, ghost
        uint256 timestamp;
    }

    SupplyChain[] public chains;

    event SupplyChainLogged(string product, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logSupplyChain(string memory product, string memory status) public onlyAdmin {
        chains.push(SupplyChain(product, status, block.timestamp));
        emit SupplyChainLogged(product, status);
    }

    function getSupplyChain(uint256 index) public view returns (string memory product, string memory status, uint256 timestamp) {
        SupplyChain memory s = chains[index];
        return (s.product, s.status, s.timestamp);
    }
}
