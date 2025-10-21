// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WorkerRightsDAO {
    address public admin;

    struct RightsEntry {
        string sectorName;
        string rightType;
        string rightsClause;
        string emotionalTag;
        bool summoned;
        bool enforced;
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

    function summonRights(string memory sectorName, string memory rightType, string memory rightsClause, string memory emotionalTag) external onlyAdmin {
        entries.push(RightsEntry(sectorName, rightType, rightsClause, emotionalTag, true, false, false));
    }

    function confirmEnforcement(uint256 index) external onlyAdmin {
        entries[index].enforced = true;
    }

    function sealRightsEntry(uint256 index) external onlyAdmin {
        require(entries[index].enforced, "Must be enforced first");
        entries[index].sealed = true;
    }

    function getRightsEntry(uint256 index) external view returns (RightsEntry memory) {
        return entries[index];
    }
}
