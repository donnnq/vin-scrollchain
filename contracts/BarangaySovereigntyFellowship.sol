// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangaySovereigntyFellowship {
    address public admin;

    struct SovereigntyEntry {
        string barangayName;
        string enforcementConcern;
        string emotionalTag;
        bool summoned;
        bool protected;
    }

    SovereigntyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonProtection(string memory barangayName, string memory enforcementConcern, string memory emotionalTag) external onlyAdmin {
        entries.push(SovereigntyEntry(barangayName, enforcementConcern, emotionalTag, true, false));
    }

    function protectBarangay(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function getSovereigntyEntry(uint256 index) external view returns (SovereigntyEntry memory) {
        return entries[index];
    }
}
