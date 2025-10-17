// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GhostProjectImmunityScanner {
    address public admin;

    struct ImmunityEntry {
        string projectName;
        string region;
        string emotionalTag;
        bool flagged;
        bool immunized;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function flagGhostProject(string memory projectName, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(projectName, region, emotionalTag, true, false));
    }

    function immunizeProject(uint256 index) external onlyAdmin {
        entries[index].immunized = true;
    }

    function getImmunity(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
