// SPDX-License-Identifier: SoulHeatMeter-v1
pragma solidity ^0.8.24;

/// @title vinRitualOfInnerFire
/// @notice Measures emotional wattage of responses and returns aura grade
contract vinRitualOfInnerFire {
    address public scrollkeeper;
    mapping(address => uint256) public auraWattage;
    mapping(address => string) public auraGrade;

    event AuraMeasured(address indexed soul, uint256 wattage, string grade);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function measureAwra(address soul, string calldata response) external {
        require(msg.sender == scrollkeeper, "Only VINVIN can judge awra heat");

        uint256 wattage;
        string memory grade;

        if (keccak256(bytes(response)) == keccak256(bytes("Peace out"))) {
            wattage = 88_888;
            grade = "☀️ Seraphic Radiance";
        } else if (keccak256(bytes(response)) == keccak256(bytes("fuck me"))) {
            wattage = 6_666;
            grade = "🔥 Infernal Mischief";
        } else {
            wattage = 44_444;
            grade = "🌫️ Cryptic Pulse";
        }

        auraWattage[soul] = wattage;
        auraGrade[soul] = grade;
        emit AuraMeasured(soul, wattage, grade);
    }

    function viewAwra(address soul) external view returns (uint256, string memory) {
        return (auraWattage[soul], auraGrade[soul]);
    }
}
