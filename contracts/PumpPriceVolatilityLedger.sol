// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PumpPriceVolatilityLedger {
    address public admin;

    struct PriceEntry {
        string region;
        uint256 pumpPrice;
        string volatilitySignal;
        string emotionalTag;
        bool logged;
        bool reviewed;
    }

    PriceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logPumpPrice(string memory region, uint256 pumpPrice, string memory volatilitySignal, string memory emotionalTag) external onlyAdmin {
        entries.push(PriceEntry(region, pumpPrice, volatilitySignal, emotionalTag, true, false));
    }

    function reviewPrice(uint256 index) external onlyAdmin {
        entries[index].reviewed = true;
    }

    function getPriceEntry(uint256 index) external view returns (PriceEntry memory) {
        return entries[index];
    }
}
