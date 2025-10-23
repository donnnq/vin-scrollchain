// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CyberattackToPolicyReformProtocol {
    address public steward;

    struct ReformEntry {
        string attackName; // "ToolShell Campaign", "Pwn2Own Exploit Chain"
        string affectedSector; // "Government", "Education", "Finance"
        string proposedPolicy; // "Mandatory patching", "Zero-trust mandate", "Threat actor sanctions"
        string emotionalTag;
        bool proposed;
        bool sealed;
    }

    ReformEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function proposeReform(string memory attackName, string memory affectedSector, string memory proposedPolicy, string memory emotionalTag) external onlySteward {
        entries.push(ReformEntry(attackName, affectedSector, proposedPolicy, emotionalTag, true, false));
    }

    function sealReformEntry(uint256 index) external onlySteward {
        require(entries[index].proposed, "Must be proposed first");
        entries[index].sealed = true;
    }

    function getReformEntry(uint256 index) external view returns (ReformEntry memory) {
        return entries[index];
    }
}
