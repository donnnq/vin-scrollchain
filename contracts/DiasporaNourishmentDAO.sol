// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiasporaNourishmentDAO {
    address public admin;

    struct NourishmentEntry {
        string communityName;
        string nourishmentTheme;
        string emotionalTag;
        bool summoned;
        bool distributed;
    }

    NourishmentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonNourishment(string memory communityName, string memory nourishmentTheme, string memory emotionalTag) external onlyAdmin {
        entries.push(NourishmentEntry(communityName, nourishmentTheme, emotionalTag, true, false));
    }

    function distributeNourishment(uint256 index) external onlyAdmin {
        entries[index].distributed = true;
    }

    function getNourishment(uint256 index) external view returns (NourishmentEntry memory) {
        return entries[index];
    }
}
