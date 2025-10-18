// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OpenSourceTalentSanctumDAO {
    address public admin;

    struct BuilderEntry {
        string name;
        string originProject;
        string newAffiliation;
        string emotionalTag;
        bool summoned;
        bool archived;
        bool protected;
    }

    BuilderEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonBuilder(string memory name, string memory originProject, string memory newAffiliation, string memory emotionalTag) external onlyAdmin {
        entries.push(BuilderEntry(name, originProject, newAffiliation, emotionalTag, true, false, false));
    }

    function archiveBuilder(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function protectBuilderLegacy(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function getBuilderEntry(uint256 index) external view returns (BuilderEntry memory) {
        return entries[index];
    }
}
