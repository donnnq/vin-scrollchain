// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ShelterDistributionTimestampLedger {
    address public validator;

    struct Distribution {
        string shelterType;
        string location;
        uint256 units;
        string transparencyTag;
        uint256 timestamp;
    }

    Distribution[] public distributions;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logDistribution(string memory _shelterType, string memory _location, uint256 _units, string memory _tag) public onlyValidator {
        distributions.push(Distribution(_shelterType, _location, _units, _tag, block.timestamp));
    }

    function getDistribution(uint256 index) public view returns (Distribution memory) {
        return distributions[index];
    }

    function totalDistributions() public view returns (uint256) {
        return distributions.length;
    }
}
