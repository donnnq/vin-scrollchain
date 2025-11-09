// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ClimateResilienceProtocolChain {
    address public validator;

    struct Protocol {
        string guardian;
        string protocolName;
        string purpose;
        uint256 timestamp;
    }

    Protocol[] public protocols;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function deployProtocol(string memory _guardian, string memory _protocolName, string memory _purpose) public onlyValidator {
        protocols.push(Protocol(_guardian, _protocolName, _purpose, block.timestamp));
    }

    function getProtocol(uint256 index) public view returns (Protocol memory) {
        return protocols[index];
    }

    function totalProtocols() public view returns (uint256) {
        return protocols.length;
    }
}
