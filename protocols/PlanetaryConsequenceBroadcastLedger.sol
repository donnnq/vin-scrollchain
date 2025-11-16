// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PlanetaryConsequenceBroadcastLedger {
    address public validator;

    struct Consequence {
        string action;
        string impact;
        string resonance;
        uint256 timestamp;
    }

    Consequence[] public consequences;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function broadcastConsequence(string memory _action, string memory _impact, string memory _resonance) public onlyValidator {
        consequences.push(Consequence(_action, _impact, _resonance, block.timestamp));
    }

    function getConsequence(uint256 index) public view returns (Consequence memory) {
        return consequences[index];
    }

    function totalConsequences() public view returns (uint256) {
        return consequences.length;
    }
}
