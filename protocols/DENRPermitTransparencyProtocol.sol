// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DENRPermitTransparencyProtocol {
    address public validator;

    struct Permit {
        string projectName;
        string location;
        string permitType;
        bool publiclyAccessible;
        uint256 timestamp;
    }

    Permit[] public permits;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logPermit(string memory _projectName, string memory _location, string memory _type, bool _public) public onlyValidator {
        permits.push(Permit(_projectName, _location, _type, _public, block.timestamp));
    }

    function getPermit(uint256 index) public view returns (Permit memory) {
        return permits[index];
    }

    function totalPermits() public view returns (uint256) {
        return permits.length;
    }
}
