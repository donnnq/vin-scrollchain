// SPDX-License-Identifier: FinalDrop-KarmaDash
pragma solidity ^0.8.24;

/// @title vinKarmicDashboard
/// @notice Displays soul alignment, aura grade, response emoji, and psychic velocity
contract vinKarmicDashboard {
    struct SoulLog {
        string response;
        string tag;
        string auraGrade;
        uint256 wattage;
    }

    mapping(address => SoulLog) public soulVault;

    function logSoul(
        address soul,
        string calldata response,
        string calldata tag,
        string calldata grade,
        uint256 wattage
    ) external {
        soulVault[soul] = SoulLog(response, tag, grade, wattage);
    }

    function readSoulLog(address soul) external view returns (
        string memory response,
        string memory tag,
        string memory grade,
        uint256 wattage
    ) {
        SoulLog memory log = soulVault[soul];
        return (log.response, log.tag, log.grade, log.wattage);
    }
}
