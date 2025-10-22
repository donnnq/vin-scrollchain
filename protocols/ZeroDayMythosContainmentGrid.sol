// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ZeroDayMythosContainmentGrid {
    address public admin;

    struct ContainmentEntry {
        string exploitName; // "CVE-2025-33073"
        string mythosSignal; // "Unknown SYSTEM breach", "Malicious SMB handshake", "Unpatched vulnerability"
        string containmentMethod; // "Network lockdown", "Forensic trace", "Patch enforcement"
        string emotionalTag;
        bool contained;
        bool sealed;
    }

    ContainmentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function containMythos(string memory exploitName, string memory mythosSignal, string memory containmentMethod, string memory emotionalTag) external onlyAdmin {
        entries.push(ContainmentEntry(exploitName, mythosSignal, containmentMethod, emotionalTag, true, false));
    }

    function sealContainmentEntry(uint256 index) external onlyAdmin {
        require(entries[index].contained, "Must be contained first");
        entries[index].sealed = true;
    }

    function getContainmentEntry(uint256 index) external view returns (ContainmentEntry memory) {
        return entries[index];
    }
}
