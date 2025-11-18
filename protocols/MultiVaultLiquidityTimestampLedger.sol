// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MultiVaultLiquidityTimestampLedger {
    address public validator;

    struct Liquidity {
        string vault;
        uint256 inflow;
        uint256 outflow;
        string liquidityTag;
        uint256 timestamp;
    }

    Liquidity[] public flows;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logLiquidity(string memory _vault, uint256 _inflow, uint256 _outflow, string memory _tag) public onlyValidator {
        flows.push(Liquidity(_vault, _inflow, _outflow, _tag, block.timestamp));
    }

    function getLiquidity(uint256 index) public view returns (Liquidity memory) {
        return flows[index];
    }

    function totalFlows() public view returns (uint256) {
        return flows.length;
    }
}
