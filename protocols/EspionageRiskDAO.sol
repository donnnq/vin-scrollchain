// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EspionageRiskDAO {
    address public validator;

    struct Risk {
        string actor;
        string method;
        string location;
        string riskTag;
        uint256 timestamp;
    }

    Risk[] public risks;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logRisk(string memory _actor, string memory _method, string memory _location, string memory _tag) public onlyValidator {
        risks.push(Risk(_actor, _method, _location, _tag, block.timestamp));
    }

    function getRisk(uint256 index) public view returns (Risk memory) {
        return risks[index];
    }

    function totalRisks() public view returns (uint256) {
        return risks.length;
    }
}
