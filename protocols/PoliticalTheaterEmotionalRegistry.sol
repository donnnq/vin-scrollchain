// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PoliticalTheaterEmotionalRegistry {
    address public admin;

    struct RegistryEntry {
        string performanceTitle; // "Trump vs Soros: IRS Edition"
        string emotionalSignal; // "Audit drama", "Philanthropy under fire"
        string emotionalTag;
        bool registered;
        bool sealed;
    }

    RegistryEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerPerformance(string memory performanceTitle, string memory emotionalSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(RegistryEntry(performanceTitle, emotionalSignal, emotionalTag, true, false));
    }

    function sealRegistryEntry(uint256 index) external onlyAdmin {
        require(entries[index].registered, "Must be registered first");
        entries[index].sealed = true;
    }

    function getRegistryEntry(uint256 index) external view returns (RegistryEntry memory) {
        return entries[index];
    }
}
