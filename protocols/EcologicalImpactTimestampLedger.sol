// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EcologicalImpactTimestampLedger {
    address public validator;

    struct Impact {
        string location;
        string species;
        string impactType;
        string impactTag;
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

    function logImpact(string memory _location, string memory _species, string memory _type, string memory _tag) public onlyValidator {
        impacts.push(Impact(_location, _species, _type, _tag, block.timestamp));
    }

    function getImpact(uint256 index) public view returns (Impact memory) {
        return impacts[index];
    }

    function totalImpacts() public view returns (uint256) {
        return impacts.length;
    }
}
