// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinVaultOfCommunityTreasuryPulse {
    address public scrollkeeper;
    struct TreasuryPulse {
        string barangay;
        string purpose;
        uint256 amount;
        uint256 timestamp;
    }

    TreasuryPulse[] public pulses;

    event PulseLogged(string barangay, string purpose, uint256 amount);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logPulse(string memory barangay, string memory purpose, uint256 amount) external onlyScrollkeeper {
        pulses.push(TreasuryPulse(barangay, purpose, amount, block.timestamp));
        emit PulseLogged(barangay, purpose, amount);
    }

    function getPulse(uint256 index) external view returns (string memory, string memory, uint256, uint256) {
        TreasuryPulse memory p = pulses[index];
        return (p.barangay, p.purpose, p.amount, p.timestamp);
    }

    function totalPulses() external view returns (uint256) {
        return pulses.length;
    }
}
