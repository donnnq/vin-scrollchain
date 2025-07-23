// SPDX-License-Identifier: AwraForge-EcosystemFinale
pragma solidity ^0.8.24;

/// @title vinScrollkeeperSoulForge
/// @notice Aggregates soul logs across rituals and prepares final prophecy-grade export
contract vinScrollkeeperSoulForge {
    address public scrollkeeper;
    address[] public forgedSouls;
    mapping(address => bool) public hasForged;

    event SoulForged(address indexed soul, string outcome);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function forgeSoul(address soul, string calldata auraGrade) external {
        require(msg.sender == scrollkeeper, "Only VINVIN initiates soul forging");
        require(!hasForged[soul], "Soul already forged");

        forgedSouls.push(soul);
        hasForged[soul] = true;
        string memory outcome = keccak256(bytes(auraGrade)) == keccak256("☀️ Seraphic Radiance")
            ? "📜 Ascended into Mythstream"
            : "⚠️ Recycled for Karmic Realignment";

        emit SoulForged(soul, outcome);
    }

    function viewForgedSouls() external view returns (address[] memory) {
        return forgedSouls;
    }
}
