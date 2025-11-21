// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CommunalWorkerProtectionProtocol {
    address public validator;

    struct Protection {
        string worker;
        string safeguard;
        string resonance;
        uint256 timestamp;
    }

    Protection[] public protections;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logProtection(string memory _worker, string memory _safeguard, string memory _resonance) public onlyValidator {
        protections.push(Protection(_worker, _safeguard, _resonance, block.timestamp));
    }

    function getProtection(uint256 index) public view returns (Protection memory) {
        return protections[index];
    }

    function totalProtections() public view returns (uint256) {
        return protections.length;
    }
}
