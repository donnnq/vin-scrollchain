// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ClimateResilienceBroadcastProtocol {
    address public validator;

    struct Initiative {
        string program;
        string impact;
        string resonance;
        uint256 timestamp;
    }

    Initiative[] public initiatives;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function broadcastInitiative(string memory _program, string memory _impact, string memory _resonance) public onlyValidator {
        initiatives.push(Initiative(_program, _impact, _resonance, block.timestamp));
    }

    function getInitiative(uint256 index) public view returns (Initiative memory) {
        return initiatives[index];
    }

    function totalInitiatives() public view returns (uint256) {
        return initiatives.length;
    }
}
