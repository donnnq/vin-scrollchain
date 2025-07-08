// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollOfGuardianship {
    address public guardian;
    bool public ritualLocked;

    constructor() {
        guardian = msg.sender;
    }

    modifier onlyGuardian() {
        require(msg.sender == guardian, "Not the guardian.");
        _;
    }

    function toggleRitualLock() external onlyGuardian {
        ritualLocked = !ritualLocked;
    }

    function performRitual() external view returns (string memory) {
        require(!ritualLocked, "Ritual is sealed.");
        return "The scroll breathes.";
    }
}
