// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicReinventionSovereigntyGrid {
    address public admin;

    struct ReinventionEntry {
        string individualName;
        string formerRole;
        string newCivicPath; // "Private life", "Public commentary", "Community work"
        string emotionalTag;
        bool sovereign;
        bool sealed;
    }

    ReinventionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function declareReinvention(string memory individualName, string memory formerRole, string memory newCivicPath, string memory emotionalTag) external onlyAdmin {
        entries.push(ReinventionEntry(individualName, formerRole, newCivicPath, emotionalTag, true, false));
    }

    function sealReinventionEntry(uint256 index) external onlyAdmin {
        require(entries[index].sovereign, "Must be sovereign first");
        entries[index].sealed = true;
    }

    function getReinventionEntry(uint256 index) external view returns (ReinventionEntry memory) {
        return entries[index];
    }
}
