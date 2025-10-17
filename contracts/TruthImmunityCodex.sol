// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TruthImmunityCodex {
    address public admin;

    struct ImmunityEntry {
        string narrativeTitle;
        string corridor;
        string emotionalTag;
        bool archived;
        bool immune;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function archiveNarrative(string memory narrativeTitle, string memory corridor, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(narrativeTitle, corridor, emotionalTag, true, false));
    }

    function markImmune(uint256 index) external onlyAdmin {
        entries[index].immune = true;
    }

    function getNarrative(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
