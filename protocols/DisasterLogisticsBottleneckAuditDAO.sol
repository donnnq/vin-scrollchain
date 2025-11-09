// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DisasterLogisticsBottleneckAuditDAO {
    address public validator;

    struct Bottleneck {
        string location;
        string type;
        string impact;
        uint256 timestamp;
    }

    Bottleneck[] public bottlenecks;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function reportBottleneck(string memory _location, string memory _type, string memory _impact) public onlyValidator {
        bottlenecks.push(Bottleneck(_location, _type, _impact, block.timestamp));
    }

    function getBottleneck(uint256 index) public view returns (Bottleneck memory) {
        return bottlenecks[index];
    }

    function totalBottlenecks() public view returns (uint256) {
        return bottlenecks.length;
    }
}
