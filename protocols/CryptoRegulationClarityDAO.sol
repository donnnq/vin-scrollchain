// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CryptoRegulationClarityDAO {
    address public validator;

    struct Rule {
        string domain;
        string requirement;
        string clarityTag;
        uint256 timestamp;
    }

    Rule[] public rules;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logRule(string memory _domain, string memory _requirement, string memory _tag) public onlyValidator {
        rules.push(Rule(_domain, _requirement, _tag, block.timestamp));
    }

    function getRule(uint256 index) public view returns (Rule memory) {
        return rules[index];
    }

    function totalRules() public view returns (uint256) {
        return rules.length;
    }
}
