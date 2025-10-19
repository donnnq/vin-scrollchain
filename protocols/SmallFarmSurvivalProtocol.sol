// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SmallFarmSurvivalProtocol {
    address public admin;

    struct SurvivalEntry {
        string farmName;
        string cropType;
        string supportClause;
        string emotionalTag;
        bool summoned;
        bool activated;
        bool sealed;
    }

    SurvivalEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSurvival(string memory farmName, string memory cropType, string memory supportClause, string memory emotionalTag) external onlyAdmin {
        entries.push(SurvivalEntry(farmName, cropType, supportClause, emotionalTag, true, false, false));
    }

    function confirmActivation(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function sealSurvivalEntry(uint256 index) external onlyAdmin {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getSurvivalEntry(uint256 index) external view returns (SurvivalEntry memory) {
        return entries[index];
    }
}
