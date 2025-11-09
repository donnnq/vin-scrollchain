// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ClimateLinkedConstructionMoratoriumProtocol {
    address public validator;

    struct Moratorium {
        string projectName;
        string location;
        string reason;
        bool enforced;
        uint256 timestamp;
    }

    Moratorium[] public moratoriums;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function enforceMoratorium(string memory _projectName, string memory _location, string memory _reason) public onlyValidator {
        moratoriums.push(Moratorium(_projectName, _location, _reason, true, block.timestamp));
    }

    function getMoratorium(uint256 index) public view returns (Moratorium memory) {
        return moratoriums[index];
    }

    function totalMoratoriums() public view returns (uint256) {
        return moratoriums.length;
    }
}
