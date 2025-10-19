// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryMigrationTreatyProtocol {
    address public admin;

    struct TreatyEntry {
        string clause;
        string region;
        string emotionalTag;
        bool summoned;
        bool ratified;
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

    function summonTreaty(string memory clause, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(TreatyEntry(clause, region, emotionalTag, true, false, false));
    }

    function ratifyTreaty(uint256 index) external onlyAdmin {
        entries[index].ratified = true;
    }

    function sealTreaty(uint256 index) external onlyAdmin {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getTreatyEntry(uint256 index) external view returns (TreatyEntry memory) {
        return entries[index];
    }
}
