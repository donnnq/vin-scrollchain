// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract RitualBasedHealingLedger {
    address public validator;

    struct HealingRitual {
        string barangay;
        string ritual;
        string facilitator;
        uint256 timestamp;
    }

    HealingRitual[] public rituals;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logRitual(string memory _barangay, string memory _ritual, string memory _facilitator) public onlyValidator {
        rituals.push(HealingRitual(_barangay, _ritual, _facilitator, block.timestamp));
    }

    function getRitual(uint256 index) public view returns (HealingRitual memory) {
        return rituals[index];
    }

    function totalRituals() public view returns (uint256) {
        return rituals.length;
    }
}
