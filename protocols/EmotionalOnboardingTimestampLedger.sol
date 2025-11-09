// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EmotionalOnboardingTimestampLedger {
    address public validator;

    struct Onboarding {
        address employee;
        string ritual;
        string emotionalTag;
        uint256 timestamp;
    }

    Onboarding[] public rituals;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logOnboarding(address _employee, string memory _ritual, string memory _tag) public onlyValidator {
        rituals.push(Onboarding(_employee, _ritual, _tag, block.timestamp));
    }

    function getOnboarding(uint256 index) public view returns (Onboarding memory) {
        return rituals[index];
    }

    function totalOnboardings() public view returns (uint256) {
        return rituals.length;
    }
}
