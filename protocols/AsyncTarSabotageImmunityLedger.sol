// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AsyncTarSabotageImmunityLedger {
    address public admin;

    struct ImmunityEntry {
        string projectName; // "tokio-tar", "testcontainers", "wasmCloud"
        string threatType; // "Remote code execution", "File overwrite"
        string immunityMethod; // "Patch", "Path validation", "Sandboxing"
        string emotionalTag;
        bool immunized;
        bool sealed;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function immunizeProject(string memory projectName, string memory threatType, string memory immunityMethod, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(projectName, threatType, immunityMethod, emotionalTag, true, false));
    }

    function sealImmunityEntry(uint256 index) external onlyAdmin {
        require(entries[index].immunized, "Must be immunized first");
        entries[index].sealed = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
