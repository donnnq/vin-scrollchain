// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DignifiedWageAdjustmentProtocol {
    address public validator;

    struct WageProfile {
        address employee;
        uint256 currentWage;
        string role;
        bool adjusted;
        uint256 timestamp;
    }

    WageProfile[] public profiles;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function adjustWage(address _employee, uint256 _currentWage, string memory _role) public onlyValidator {
        uint256 newWage = _currentWage;
        if (_currentWage < 20000) {
            newWage = _currentWage * 2;
        } else if (_currentWage > 1000000) {
            newWage = _currentWage / 2;
        }
        profiles.push(WageProfile(_employee, newWage, _role, true, block.timestamp));
    }

    function getProfile(uint256 index) public view returns (WageProfile memory) {
        return profiles[index];
    }

    function totalProfiles() public view returns (uint256) {
        return profiles.length;
    }
}
