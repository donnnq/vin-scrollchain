// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MultiBankLiquidityAuditDAO {
    address public validator;

    struct Liquidity {
        string bank;
        uint256 amount;
        string currency;
        uint256 timestamp;
    }

    Liquidity[] public audits;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logLiquidity(string memory _bank, uint256 _amount, string memory _currency) public onlyValidator {
        audits.push(Liquidity(_bank, _amount, _currency, block.timestamp));
    }

    function getLiquidity(uint256 index) public view returns (Liquidity memory) {
        return audits[index];
    }

    function totalAudits() public view returns (uint256) {
        return audits.length;
    }
}
