// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DigitalSovereigntyDAO {
    address public validator;

    struct Sovereignty {
        string system;
        string jurisdiction;
        string sovereigntyTag;
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

    function logSovereignty(string memory _system, string memory _jurisdiction, string memory _tag) public onlyValidator {
        records.push(Sovereignty(_system, _jurisdiction, _tag, block.timestamp));
    }

    function getSovereignty(uint256 index) public view returns (Sovereignty memory) {
        return records[index];
    }

    function totalRecords() public view returns (uint256) {
        return records.length;
    }
}
