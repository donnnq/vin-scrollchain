// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TentDwellerRiskIndexDAO {
    address public validator;

    struct TentDweller {
        string location;
        uint8 riskScore; // 0–100
        string condition;
        uint256 timestamp;
    }

    TentDweller[] public dwellers;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function submitRisk(string memory _location, uint8 _score, string memory _condition) public onlyValidator {
        require(_score <= 100, "Score must be 0–100");
        dwellers.push(TentDweller(_location, _score, _condition, block.timestamp));
    }

    function getDweller(uint256 index) public view returns (TentDweller memory) {
        return dwellers[index];
    }

    function totalDwellers() public view returns (uint256) {
        return dwellers.length;
    }
}
