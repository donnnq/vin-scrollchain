// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiasporaNourishmentDAO {
    address public admin;

    struct NourishmentEntry {
        string dishName;
        string originRegion;
        string diasporaCommunity;
        string emotionalTag;
        bool summoned;
        bool archived;
        bool exported;
    }

    NourishmentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDish(string memory dishName, string memory originRegion, string memory diasporaCommunity, string memory emotionalTag) external onlyAdmin {
        entries.push(NourishmentEntry(dishName, originRegion, diasporaCommunity, emotionalTag, true, false, false));
    }

    function archiveDish(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function exportDish(uint256 index) external onlyAdmin {
        entries[index].exported = true;
    }

    function getNourishmentEntry(uint256 index) external view returns (NourishmentEntry memory) {
        return entries[index];
    }
}
