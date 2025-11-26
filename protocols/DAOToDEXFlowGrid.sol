// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToDEXFlowGrid {
    string public batchID = "1321.9.131";
    string public steward = "Vinvin";

    address public admin;

    struct DEXFlow {
        string pool;
        uint256 volume;
        uint256 slippage;
        uint256 timestamp;
    }

    DEXFlow[] public flows;

    event FlowLogged(string pool, uint256 volume, uint256 slippage);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logFlow(string memory pool, uint256 volume, uint256 slippage) public onlyAdmin {
        flows.push(DEXFlow(pool, volume, slippage, block.timestamp));
        emit FlowLogged(pool, volume, slippage);
    }

    function getFlow(uint256 index) public view returns (string memory pool, uint256 volume, uint256 slippage, uint256 timestamp) {
        DEXFlow memory f = flows[index];
        return (f.pool, f.volume, f.slippage, f.timestamp);
    }
}
