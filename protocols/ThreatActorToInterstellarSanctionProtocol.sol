// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ThreatActorToInterstellarSanctionProtocol {
    address public steward;

    struct SanctionEntry {
        string actorName;
        string exploitUsed;
        string sanctionLevel; // "Planetary", "Orbital", "Interstellar"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    SanctionEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexSanction(string memory actorName, string memory exploitUsed, string memory sanctionLevel, string memory emotionalTag) external onlySteward {
        entries.push(SanctionEntry(actorName, exploitUsed, sanctionLevel, emotionalTag, true, false));
    }

    function sealSanctionEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getSanctionEntry(uint256 index) external view returns (SanctionEntry memory) {
        return entries[index];
    }
}
