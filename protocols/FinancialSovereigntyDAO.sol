// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FinancialSovereigntyDAO {
    address public validator;

    struct Sovereignty {
        string vault;
        string assetType;
        uint256 balance;
        string auditTag;
        uint256 timestamp;
    }

    Sovereignty[] public records;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logSovereignty(string memory _vault, string memory _asset, uint256 _balance, string memory _tag) public onlyValidator {
        records.push(Sovereignty(_vault, _asset, _balance, _tag, block.timestamp));
    }

    function getSovereignty(uint256 index) public view returns (Sovereignty memory) {
        return records[index];
    }

    function totalRecords() public view returns (uint256) {
        return records.length;
    }
}
