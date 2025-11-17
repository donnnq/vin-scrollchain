// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract HealthInfrastructureIntegrityDAO {
    address public validator;

    struct Facility {
        string name;
        string location;
        string status;
        string integrityTag;
        uint256 timestamp;
    }

    Facility[] public facilities;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logFacility(string memory _name, string memory _location, string memory _status, string memory _tag) public onlyValidator {
        facilities.push(Facility(_name, _location, _status, _tag, block.timestamp));
    }

    function getFacility(uint256 index) public view returns (Facility memory) {
        return facilities[index];
    }

    function totalFacilities() public view returns (uint256) {
        return facilities.length;
    }
}
