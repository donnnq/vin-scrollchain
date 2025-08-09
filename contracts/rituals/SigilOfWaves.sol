// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title SigilOfWaves — Ledger of allied patrol deployments
/// @notice Records every maneuver as a sovereign ripple in the scrollchain

contract SigilOfWaves {
    address public scrollsmith;

    struct Wave {
        string allyName;
        string zone;
        uint256 units;
        uint256 timestamp;
        string message;
    }

    Wave[] public waves;

    event WaveLogged(string allyName, string zone, uint256 units, string message);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Unauthorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    function logWave(
        string calldata allyName,
        string calldata zone,
        uint256 units,
        string calldata message
    ) external onlyScrollsmith {
        waves.push(Wave(allyName, zone, units, block.timestamp, message));
        emit WaveLogged(allyName, zone, units, message);
    }

    function getWave(uint256 index) external view returns (Wave memory) {
        return waves[index];
    }

    function totalWaves() external view returns (uint256) {
        return waves.length;
    }
}
