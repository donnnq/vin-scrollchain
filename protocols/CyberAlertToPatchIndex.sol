// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CyberAlertToPatchIndex {
    address public steward;

    struct PatchEntry {
        string vulnerability; // "Jira filesystem exploit", "GlassWorm malware"
        string affectedSystem; // "VS Code", "Jira Software"
        string patchStatus; // "Pending", "Deployed", "Under review"
        string emotionalTag;
        bool logged;
        bool sealed;
    }

    PatchEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function logPatch(string memory vulnerability, string memory affectedSystem, string memory patchStatus, string memory emotionalTag) external onlySteward {
        entries.push(PatchEntry(vulnerability, affectedSystem, patchStatus, emotionalTag, true, false));
    }

    function sealPatchEntry(uint256 index) external onlySteard {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getPatchEntry(uint256 index) external view returns (PatchEntry memory) {
        return entries[index];
    }
}
