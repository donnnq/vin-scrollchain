// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BarangayFloodRiskIndexDAO {
    address public validator;

    struct RiskProfile {
        string barangay;
        uint8 riskScore; // 0–100
        string trigger;
        uint256 timestamp;
    }

    RiskProfile[] public profiles;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function submitProfile(string memory _barangay, uint8 _score, string memory _trigger) public onlyValidator {
        require(_score <= 100, "Score must be 0–100");
        profiles.push(RiskProfile(_barangay, _score, _trigger, block.timestamp));
    }

    function getProfile(uint256 index) public view returns (RiskProfile memory) {
        return profiles[index];
    }

    function totalProfiles() public view returns (uint256) {
        return profiles.length;
    }
}
