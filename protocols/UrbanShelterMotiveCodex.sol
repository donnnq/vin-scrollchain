// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanShelterMotiveCodex {
    address public admin;

    struct MotiveEntry {
        string zone;
        string motiveType; // "Survival", "Visibility Leverage", "Relocation Trigger"
        string codexClause;
        string emotionalTag;
        bool summoned;
        bool decoded;
        bool sealed;
    }

    MotiveEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonMotive(string memory zone, string memory motiveType, string memory codexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(MotiveEntry(zone, motiveType, codexClause, emotionalTag, true, false, false));
    }

    function confirmDecoding(uint256 index) external onlyAdmin {
        entries[index].decoded = true;
    }

    function sealMotiveEntry(uint256 index) external onlyAdmin {
        require(entries[index].decoded, "Must be decoded first");
        entries[index].sealed = true;
    }

    function getMotiveEntry(uint256 index) external view returns (MotiveEntry memory) {
        return entries[index];
    }
}
