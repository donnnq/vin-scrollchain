// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryNutritionTreatyProtocol {
    address public admin;

    struct TreatyEntry {
        string nutrient;
        string sourceCrop;
        string emotionalTag;
        bool summoned;
        bool guaranteed;
        bool sealed;
    }

    TreatyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTreaty(string memory nutrient, string memory sourceCrop, string memory emotionalTag) external onlyAdmin {
        entries.push(TreatyEntry(nutrient, sourceCrop, emotionalTag, true, false, false));
    }

    function guaranteeNutrition(uint256 index) external onlyAdmin {
        entries[index].guaranteed = true;
    }

    function sealTreaty(uint256 index) external onlyAdmin {
        require(entries[index].guaranteed, "Must be guaranteed first");
        entries[index].sealed = true;
    }

    function getTreatyEntry(uint256 index) external view returns (TreatyEntry memory) {
        return entries[index];
    }
}
