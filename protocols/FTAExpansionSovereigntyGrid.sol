// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FTAExpansionSovereigntyGrid {
    address public admin;

    struct FTAEntry {
        string country; // "Philippines"
        string partner; // "EU", "UAE", "Canada", "Chile"
        string status; // "Negotiating", "Signed", "Pending ratification"
        string emotionalTag;
        bool expanded;
        bool sealed;
    }

    FTAEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function expandFTA(string memory country, string memory partner, string memory status, string memory emotionalTag) external onlyAdmin {
        entries.push(FTAEntry(country, partner, status, emotionalTag, true, false));
    }

    function sealFTAEntry(uint256 index) external onlyAdmin {
        require(entries[index].expanded, "Must be expanded first");
        entries[index].sealed = true;
    }

    function getFTAEntry(uint256 index) external view returns (FTAEntry memory) {
        return entries[index];
    }
}
