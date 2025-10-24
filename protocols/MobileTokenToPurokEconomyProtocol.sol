// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MobileTokenToPurokEconomyProtocol {
    address public steward;

    struct TokenEntry {
        string tokenName; // "Pi Network", "USDT"
        string useCase; // "Local trade", "Purok rewards", "Esplanade vendor payments"
        string economicSignal; // "Liquidity boost", "Community empowerment"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    TokenEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateToken(string memory tokenName, string memory useCase, string memory economicSignal, string memory emotionalTag) external onlySteward {
        entries.push(TokenEntry(tokenName, useCase, economicSignal, emotionalTag, true, false));
    }

    function sealTokenEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getTokenEntry(uint256 index) external view returns (TokenEntry memory) {
        return entries[index];
    }
}
