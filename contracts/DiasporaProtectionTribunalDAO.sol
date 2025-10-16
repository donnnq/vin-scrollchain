// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiasporaProtectionTribunalDAO {
    address public admin;

    struct TribunalEntry {
        string caseTitle;
        string region;
        string violationType;
        string emotionalTag;
        bool heard;
        bool resolved;
    }

    TribunalEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitCase(string memory caseTitle, string memory region, string memory violationType, string memory emotionalTag) external onlyAdmin {
        entries.push(TribunalEntry(caseTitle, region, violationType, emotionalTag, false, false));
    }

    function markHeard(uint256 index) external onlyAdmin {
        entries[index].heard = true;
    }

    function markResolved(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getCase(uint256 index) external view returns (TribunalEntry memory) {
        return entries[index];
    }
}
