// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DeforestationImpactTimestampLedger {
    address public validator;

    struct Impact {
        string location;
        uint256 treesRemoved;
        string consequence;
        uint256 timestamp;
    }

    Impact[] public impacts;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logImpact(string memory _location, uint256 _treesRemoved, string memory _consequence) public onlyValidator {
        impacts.push(Impact(_location, _treesRemoved, _consequence, block.timestamp));
    }

    function getImpact(uint256 index) public view returns (Impact memory) {
        return impacts[index];
    }

    function totalImpacts() public view returns (uint256) {
        return impacts.length;
    }
}
