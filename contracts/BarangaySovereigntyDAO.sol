// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangaySovereigntyDAO {
    address public admin;

    struct SovereigntyEntry {
        string barangayName;
        string autonomyTheme;
        string emotionalTag;
        bool summoned;
        bool reinforced;
    }

    SovereigntyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSovereignty(string memory barangayName, string memory autonomyTheme, string memory emotionalTag) external onlyAdmin {
        entries.push(SovereigntyEntry(barangayName, autonomyTheme, emotionalTag, true, false));
    }

    function reinforceSovereignty(uint256 index) external onlyAdmin {
        entries[index].reinforced = true;
    }

    function getSovereignty(uint256 index) external view returns (SovereigntyEntry memory) {
        return entries[index];
    }
}
