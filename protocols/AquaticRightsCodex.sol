// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AquaticRightsCodex {
    address public admin;

    struct RightsEntry {
        string riverName;
        string rightType;
        string codexClause;
        string emotionalTag;
        bool summoned;
        bool ratified;
        bool sealed;
    }

    RightsEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRights(string memory riverName, string memory rightType, string memory codexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(RightsEntry(riverName, rightType, codexClause, emotionalTag, true, false, false));
    }

    function confirmRatification(uint256 index) external onlyAdmin {
        entries[index].ratified = true;
    }

    function sealRightsEntry(uint256 index) external onlyAdmin {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getRightsEntry(uint256 index) external view returns (RightsEntry memory) {
        return entries[index];
    }
}
