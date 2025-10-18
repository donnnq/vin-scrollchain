// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalGDPShockNarrativeCodex {
    address public admin;

    struct NarrativeEntry {
        string incidentName;
        string economicHighlight;
        string emotionalTag;
        bool aired;
        bool archived;
    }

    NarrativeEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitNarrative(string memory incidentName, string memory economicHighlight, string memory emotionalTag) external onlyAdmin {
        entries.push(NarrativeEntry(incidentName, economicHighlight, emotionalTag, false, false));
    }

    function airNarrative(uint256 index) external onlyAdmin {
        entries[index].aired = true;
    }

    function archiveNarrative(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getNarrativeEntry(uint256 index) external view returns (NarrativeEntry memory) {
        return entries[index];
    }
}
