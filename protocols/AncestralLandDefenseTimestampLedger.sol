// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract AncestralLandDefenseTimestampLedger {
    address public validator;

    struct Defense {
        string location;
        string tribe;
        string action;
        string resonance;
        uint256 timestamp;
    }

    Defense[] public defenses;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logDefense(string memory _location, string memory _tribe, string memory _action, string memory _resonance) public onlyValidator {
        defenses.push(Defense(_location, _tribe, _action, _resonance, block.timestamp));
    }

    function getDefense(uint256 index) public view returns (Defense memory) {
        return defenses[index];
    }

    function totalDefenses() public view returns (uint256) {
        return defenses.length;
    }
}
