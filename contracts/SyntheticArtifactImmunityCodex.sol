// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SyntheticArtifactImmunityCodex {
    address public admin;

    struct ImmunityEntry {
        string artifactType;
        string misusePattern;
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

    function flagArtifact(string memory artifactType, string memory misusePattern, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(artifactType, misusePattern, emotionalTag, true, false));
    }

    function immunizeArtifact(uint256 index) external onlyAdmin {
        entries[index].immunized = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
