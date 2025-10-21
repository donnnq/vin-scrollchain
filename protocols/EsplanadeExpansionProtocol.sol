// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EsplanadeExpansionProtocol {
    address public admin;

    struct ExpansionEntry {
        string side; // "North", "South", "Both"
        string featureType; // "Walkway", "Bench", "Lighting"
        string clause;
        string emotionalTag;
        bool summoned;
        bool expanded;
        bool sealed;
    }

    ExpansionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonExpansion(string memory side, string memory featureType, string memory clause, string memory emotionalTag) external onlyAdmin {
        entries.push(ExpansionEntry(side, featureType, clause, emotionalTag, true, false, false));
    }

    function confirmExpansion(uint256 index) external onlyAdmin {
        entries[index].expanded = true;
    }

    function sealExpansionEntry(uint256 index) external onlyAdmin {
        require(entries[index].expanded, "Must be expanded first");
        entries[index].sealed = true;
    }

    function getExpansionEntry(uint256 index) external view returns (ExpansionEntry memory) {
        return entries[index];
    }
}
