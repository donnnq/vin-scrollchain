// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForestCanopyDAO {
    address public admin;

    struct CanopyEntry {
        string forestZone;
        string canopyType; // "Shade Corridor", "Bird Habitat", "Quiet Trail"
        string ritualClause;
        string emotionalTag;
        bool summoned;
        bool protected;
        bool sealed;
    }

    CanopyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonCanopy(string memory forestZone, string memory canopyType, string memory ritualClause, string memory emotionalTag) external onlyAdmin {
        entries.push(CanopyEntry(forestZone, canopyType, ritualClause, emotionalTag, true, false, false));
    }

    function confirmProtection(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealCanopyEntry(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getCanopyEntry(uint256 index) external view returns (CanopyEntry memory) {
        return entries[index];
    }
}
