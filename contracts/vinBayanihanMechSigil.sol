// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinBayanihanMechSigil {
    address public scrollKeeper;
    mapping(address => bool) public civicHelpers;
    uint256 public unityThreshold = 100;
    uint256 public currentSigilsForged;

    event BayanihanSummon(address indexed helper);
    event MechSigilActivated(string message);

    modifier onlyKeeper() {
        require(msg.sender == scrollKeeper, "Not the scroll keeper");
        _;
    }

    constructor() {
        scrollKeeper = msg.sender;
    }

    function forgeUnitySigil() external {
        require(!civicHelpers[msg.sender], "Already joined");
        civicHelpers[msg.sender] = true;
        currentSigilsForged += 1;
        emit BayanihanSummon(msg.sender);

        if (currentSigilsForged >= unityThreshold) {
            emit MechSigilActivated("Bayanihan Mech Activated — Defense through Solidarity ⚔️🫱🏽‍🫲🏻");
        }
    }

    function adjustThreshold(uint256 newThreshold) external onlyKeeper {
        unityThreshold = newThreshold;
    }
}
