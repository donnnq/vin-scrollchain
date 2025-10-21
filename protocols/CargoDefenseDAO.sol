// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CargoDefenseDAO {
    address public admin;

    struct DefenseEntry {
        string route;
        string cargoType; // "Scrap Metal", "Groceries", "Electronics"
        string defenseClause;
        string emotionalTag;
        bool summoned;
        bool reinforced;
        bool sealed;
    }

    DefenseEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDefense(string memory route, string memory cargoType, string memory defenseClause, string memory emotionalTag) external onlyAdmin {
        entries.push(DefenseEntry(route, cargoType, defenseClause, emotionalTag, true, false, false));
    }

    function confirmReinforcement(uint256 index) external onlyAdmin {
        entries[index].reinforced = true;
    }

    function sealDefenseEntry(uint256 index) external onlyAdmin {
        require(entries[index].reinforced, "Must be reinforced first");
        entries[index].sealed = true;
    }

    function getDefenseEntry(uint256 index) external view returns (DefenseEntry memory) {
        return entries[index];
    }
}
