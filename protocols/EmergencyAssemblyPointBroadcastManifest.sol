// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EmergencyAssemblyPointBroadcastManifest {
    address public validator;

    struct AssemblyPoint {
        string barangay;
        string location;
        string capacity;
        uint256 timestamp;
    }

    AssemblyPoint[] public points;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function broadcastPoint(string memory _barangay, string memory _location, string memory _capacity) public onlyValidator {
        points.push(AssemblyPoint(_barangay, _location, _capacity, block.timestamp));
    }

    function getPoint(uint256 index) public view returns (AssemblyPoint memory) {
        return points[index];
    }

    function totalPoints() public view returns (uint256) {
        return points.length;
    }
}
