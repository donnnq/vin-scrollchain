// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PalayPriceImmunityProtocol {
    address public admin;

    struct PriceEntry {
        string region;
        uint256 floorPrice;
        string emotionalTag;
        bool summoned;
        bool protected;
        bool sealed;
    }

    PriceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonPrice(string memory region, uint256 floorPrice, string memory emotionalTag) external onlyAdmin {
        entries.push(PriceEntry(region, floorPrice, emotionalTag, true, false, false));
    }

    function protectPrice(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealPrice(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getPriceEntry(uint256 index) external view returns (PriceEntry memory) {
        return entries[index];
    }
}
