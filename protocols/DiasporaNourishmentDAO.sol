// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiasporaNourishmentDAO {
    address public admin;

    struct NourishmentEntry {
        string dishName;
        string originRegion;
        string emotionalTag;
        bool summoned;
        bool flagged;
        bool revived;
    }

    NourishmentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDish(string memory dishName, string memory originRegion, string memory emotionalTag) external onlyAdmin {
        entries.push(NourishmentEntry(dishName, originRegion, emotionalTag, true, false, false));
    }

    function flagForRevival(uint256 index) external onlyAdmin {
        entries[index].flagged = true;
    }

    function reviveDish(uint256 index) external onlyAdmin {
        require(entries[index].flagged, "Must be flagged first");
        entries[index].revived = true;
    }

    function getNourishmentEntry(uint256 index) external view returns (NourishmentEntry memory) {
        return entries[index];
    }
}
