// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GenZLaborEquityDAO {
    address public admin;

    struct LaborEntry {
        string sector;
        string region;
        string emotionalTag;
        bool summoned;
        bool protected;
        bool ratified;
    }

    LaborEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonLabor(string memory sector, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(LaborEntry(sector, region, emotionalTag, true, false, false));
    }

    function protectLabor(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function ratifyLabor(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].ratified = true;
    }

    function getLaborEntry(uint256 index) external view returns (LaborEntry memory) {
        return entries[index];
    }
}
