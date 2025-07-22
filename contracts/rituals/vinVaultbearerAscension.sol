// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title vinVaultbearerAscension
/// @notice Legacy-tier elevation path for mythstream guardians of ultimate trust
contract vinVaultbearerAscension {
    address public scrollkeeper;
    mapping(address => bool) public ascendedSouls;
    mapping(address => string) public legendLore;

    event AscensionMarked(address indexed soul);
    event LoreWritten(address indexed soul, string lore);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not VINVIN's chosen keeper");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function ascendSoul(address soul, string calldata loreText) external onlyScrollkeeper {
        ascendedSouls[soul] = true;
        legendLore[soul] = loreText;
        emit AscensionMarked(soul);
        emit LoreWritten(soul, loreText);
    }

    function getAscensionStatus(address soul) external view returns (bool ascended, string memory loreText) {
        ascended = ascendedSouls[soul];
        loreText = legendLore[soul];
    }
}
