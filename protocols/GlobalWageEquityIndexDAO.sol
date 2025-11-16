// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GlobalWageEquityIndexDAO {
    address public validator;

    struct WageIndex {
        string country;
        uint256 medianWage;
        uint256 livingWage;
        uint8 equityScore; // 0–100
        uint256 timestamp;
    }

    WageIndex[] public indexes;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logIndex(string memory _country, uint256 _median, uint256 _living, uint8 _score) public onlyValidator {
        indexes.push(WageIndex(_country, _median, _living, _score, block.timestamp));
    }

    function getIndex(uint256 index) public view returns (WageIndex memory) {
        return indexes[index];
    }

    function totalIndexes() public view returns (uint256) {
        return indexes.length;
    }
}
