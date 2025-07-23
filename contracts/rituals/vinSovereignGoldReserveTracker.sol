// SPDX-License-Identifier: VIN-GoldAudit
pragma solidity ^0.8.19;

contract vinSovereignGoldReserveTracker {
    address public vinvinSoul;
    uint256 public totalGoldReserves;
    string public sourceNote;

    event ReserveLogged(uint256 amount, string source);

    constructor() {
        vinvinSoul = msg.sender;
        totalGoldReserves = 0;
    }

    function logReserve(uint256 amount, string memory source) external {
        totalGoldReserves += amount;
        sourceNote = source;
        emit ReserveLogged(amount, source);
    }
}
