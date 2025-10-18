// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryCivicReckoningCodex {
    address public admin;

    struct ReckoningEntry {
        string name;
        string violation;
        string emotionalTag;
        bool summoned;
        bool archived;
        bool sealedForPublicRecord;
    }

    ReckoningEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonReckoning(string memory name, string memory violation, string memory emotionalTag) external onlyAdmin {
        entries.push(ReckoningEntry(name, violation, emotionalTag, true, false, false));
    }

    function archiveReckoning(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function sealForPublicRecord(uint256 index) external onlyAdmin {
        entries[index].sealedForPublicRecord = true;
    }

    function getReckoningEntry(uint256 index) external view returns (ReckoningEntry memory) {
        return entries[index];
    }
}
