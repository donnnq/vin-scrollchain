// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VocationalGrantsDAO {
    address public admin;

    struct GrantEntry {
        string programName;
        string sponsorEntity;
        string targetRegion;
        string emotionalTag;
        bool summoned;
        bool approved;
        bool sealed;
    }

    GrantEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonGrant(string memory programName, string memory sponsorEntity, string memory targetRegion, string memory emotionalTag) external onlyAdmin {
        entries.push(GrantEntry(programName, sponsorEntity, targetRegion, emotionalTag, true, false, false));
    }

    function confirmApproval(uint256 index) external onlyAdmin {
        entries[index].approved = true;
    }

    function sealGrantEntry(uint256 index) external onlyAdmin {
        require(entries[index].approved, "Must be approved first");
        entries[index].sealed = true;
    }

    function getGrantEntry(uint256 index) external view returns (GrantEntry memory) {
        return entries[index];
    }
}
