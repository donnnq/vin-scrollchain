// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryFamilyDAO {
    address public admin;

    struct FamilyEntry {
        string personLabel;
        string emotionalMessage;
        string regionTag;
        bool welcomed;
        bool archived;
    }

    FamilyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitFamilyEntry(string memory personLabel, string memory emotionalMessage, string memory regionTag) external onlyAdmin {
        entries.push(FamilyEntry(personLabel, emotionalMessage, regionTag, false, false));
    }

    function welcomeMember(uint256 index) external onlyAdmin {
        entries[index].welcomed = true;
    }

    function archiveEntry(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getFamilyEntry(uint256 index) external view returns (FamilyEntry memory) {
        return entries[index];
    }
}
