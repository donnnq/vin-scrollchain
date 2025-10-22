// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NetworkForensicsRitualIndex {
    address public admin;

    struct ForensicsEntry {
        string breachVector; // "Malicious SMB server"
        string forensicSignal; // "Outbound SMB trace", "Privilege escalation log", "Unauthorized SYSTEM access"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    ForensicsEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function indexForensics(string memory breachVector, string memory forensicSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(ForensicsEntry(breachVector, forensicSignal, emotionalTag, true, false));
    }

    function sealForensicsEntry(uint256 index) external onlyAdmin {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getForensicsEntry(uint256 index) external view returns (ForensicsEntry memory) {
        return entries[index];
    }
}
