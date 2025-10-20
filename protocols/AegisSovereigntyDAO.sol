// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AegisSovereigntyDAO {
    address public admin;

    struct SovereigntyEntry {
        string countryName;
        string defenseNeed;
        string coDevelopmentClause;
        string emotionalTag;
        bool summoned;
        bool approved;
        bool sealed;
    }

    SovereigntyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonEntry(string memory countryName, string memory defenseNeed, string memory coDevelopmentClause, string memory emotionalTag) external onlyAdmin {
        entries.push(SovereigntyEntry(countryName, defenseNeed, coDevelopmentClause, emotionalTag, true, false, false));
    }

    function confirmApproval(uint256 index) external onlyAdmin {
        entries[index].approved = true;
    }

    function sealSovereigntyEntry(uint256 index) external onlyAdmin {
        require(entries[index].approved, "Must be approved first");
        entries[index].sealed = true;
    }

    function getSovereigntyEntry(uint256 index) external view returns (SovereigntyEntry memory) {
        return entries[index];
    }
}
