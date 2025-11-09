// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DignityBasedRetentionProtocolChain {
    address public validator;

    struct Retention {
        address employee;
        string ritual;
        string dignityTag;
        uint256 timestamp;
    }

    Retention[] public protocols;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function deployProtocol(address _employee, string memory _ritual, string memory _tag) public onlyValidator {
        protocols.push(Retention(_employee, _ritual, _tag, block.timestamp));
    }

    function getProtocol(uint256 index) public view returns (Retention memory) {
        return protocols[index];
    }

    function totalProtocols() public view returns (uint256) {
        return protocols.length;
    }
}
