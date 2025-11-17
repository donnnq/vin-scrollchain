// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PermitOpacityExposureProtocol {
    address public validator;

    struct Permit {
        string project;
        string permitType;
        bool transparent;
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

    function logPermit(string memory _project, string memory _type, bool _transparent) public onlyValidator {
        permits.push(Permit(_project, _type, _transparent, block.timestamp));
    }

    function getPermit(uint256 index) public view returns (Permit memory) {
        return permits[index];
    }

    function totalPermits() public view returns (uint256) {
        return permits.length;
    }
}
