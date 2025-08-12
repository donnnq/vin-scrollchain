// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinCapitalPulse - Ritual contract to track velocity of money and civic impact
/// @author Vinvin
/// @notice Monitors economic pulse, interest rate shifts, and social resonance
/// @dev Designed for civic economists, mythic auditors, and decentralized observers

contract vinCapitalPulse {
    address public scrollsmith;

    struct Pulse {
        uint256 velocityOfMoney; // Measured in basis points (bps)
        uint256 interestRate;    // Central rate in bps
        string civicImpact;      // Narrative or observed effect
        uint256 timestamp;
    }

    Pulse[] public pulses;

    event PulseLogged(uint256 velocity, uint256 interestRate, string civicImpact);

    constructor() {
        scrollsmith = msg.sender;
    }

    function logPulse(uint256 velocityOfMoney, uint256 interestRate, string memory civicImpact) public {
        pulses.push(Pulse(velocityOfMoney, interestRate, civicImpact, block.timestamp));
        emit PulseLogged(velocityOfMoney, interestRate, civicImpact);
    }

    function latestPulse() public view returns (Pulse memory) {
        require(pulses.length > 0, "No pulses logged yet");
        return pulses[pulses.length - 1];
    }

    function totalPulses() public view returns (uint256) {
        return pulses.length;
    }
}
