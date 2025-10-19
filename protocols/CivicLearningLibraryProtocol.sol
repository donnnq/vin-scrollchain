// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicLearningLibraryProtocol {
    address public admin;

    struct LibraryEntry {
        string buildingName;
        string designStyle;
        string accessPath;
        string emotionalTag;
        bool summoned;
        bool endorsed;
        bool sealed;
    }

    LibraryEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonLibrary(string memory buildingName, string memory designStyle, string memory accessPath, string memory emotionalTag) external onlyAdmin {
        entries.push(LibraryEntry(buildingName, designStyle, accessPath, emotionalTag, true, false, false));
    }

    function confirmEndorsement(uint256 index) external onlyAdmin {
        entries[index].endorsed = true;
    }

    function sealLibraryEntry(uint256 index) external onlyAdmin {
        require(entries[index].endorsed, "Must be endorsed first");
        entries[index].sealed = true;
    }

    function getLibraryEntry(uint256 index) external view returns (LibraryEntry memory) {
        return entries[index];
    }
}
