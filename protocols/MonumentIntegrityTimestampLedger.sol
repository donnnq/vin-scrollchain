// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MonumentIntegrityTimestampLedger {
    address public validator;

    struct Monument {
        string monument;
        string status;
        string integrityTag;
        uint256 timestamp;
    }

    Monument[] public monuments;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logMonument(string memory _monument, string memory _status, string memory _tag) public onlyValidator {
        monuments.push(Monument(_monument, _status, _tag, block.timestamp));
    }

    function getMonument(uint256 index) public view returns (Monument memory) {
        return monuments[index];
    }

    function totalMonuments() public view returns (uint256) {
        return monuments.length;
    }
}
