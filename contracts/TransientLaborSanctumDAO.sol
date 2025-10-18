// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TransientLaborSanctumDAO {
    address public admin;

    struct SanctumEntry {
        string workerName;
        string projectSite;
        string emotionalTag;
        bool summoned;
        bool protected;
    }

    SanctumEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSanctum(string memory workerName, string memory projectSite, string memory emotionalTag) external onlyAdmin {
        entries.push(SanctumEntry(workerName, projectSite, emotionalTag, true, false));
    }

    function protectSanctum(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function getSanctumEntry(uint256 index) external view returns (SanctumEntry memory) {
        return entries[index];
    }
}
