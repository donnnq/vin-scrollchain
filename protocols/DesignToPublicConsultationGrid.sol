// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DesignToPublicConsultationGrid {
    address public steward;

    struct DesignEntry {
        string projectName; // "Tagaytay Flyover"
        string designFeature; // "Snake-like curve"
        string consultationMethod; // "Barangay hearing", "Scrollchain feedback", "Online poll"
        string emotionalTag;
        bool consulted;
        bool sealed;
    }

    DesignEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function logConsultation(string memory projectName, string memory designFeature, string memory consultationMethod, string memory emotionalTag) external onlySteward {
        entries.push(DesignEntry(projectName, designFeature, consultationMethod, emotionalTag, true, false));
    }

    function sealDesignEntry(uint256 index) external onlySteward {
        require(entries[index].consulted, "Must be consulted first");
        entries[index].sealed = true;
    }

    function getDesignEntry(uint256 index) external view returns (DesignEntry memory) {
        return entries[index];
    }
}
