// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CyberattackToUNResolutionTracker {
    address public steward;

    struct ResolutionEntry {
        string attackName;
        string affectedRegion;
        string resolutionTitle; // "UN Cyber Defense Mandate", "Global Sanction Protocol"
        string emotionalTag;
        bool proposed;
        bool sealed;
    }

    ResolutionEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function proposeResolution(string memory attackName, string memory affectedRegion, string memory resolutionTitle, string memory emotionalTag) external onlySteward {
        entries.push(ResolutionEntry(attackName, affectedRegion, resolutionTitle, emotionalTag, true, false));
    }

    function sealResolutionEntry(uint256 index) external onlySteward {
        require(entries[index].proposed, "Must be proposed first");
        entries[index].sealed = true;
    }

    function getResolutionEntry(uint256 index) external view returns (ResolutionEntry memory) {
        return entries[index];
    }
}
