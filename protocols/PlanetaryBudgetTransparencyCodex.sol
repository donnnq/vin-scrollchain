// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryBudgetTransparencyCodex {
    address public admin;

    struct TransparencyEntry {
        string countryName;
        string department;
        uint256 publishedAmount;
        string emotionalTag;
        bool summoned;
        bool published;
        bool sealed;
    }

    TransparencyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTransparency(string memory countryName, string memory department, uint256 publishedAmount, string memory emotionalTag) external onlyAdmin {
        entries.push(TransparencyEntry(countryName, department, publishedAmount, emotionalTag, true, false, false));
    }

    function confirmPublication(uint256 index) external onlyAdmin {
        entries[index].published = true;
    }

    function sealTransparencyEntry(uint256 index) external onlyAdmin {
        require(entries[index].published, "Must be published first");
        entries[index].sealed = true;
    }

    function getTransparencyEntry(uint256 index) external view returns (TransparencyEntry memory) {
        return entries[index];
    }
}
