// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LaborSanctumDAO {
    address public admin;

    struct LaborEntry {
        string workerName;
        string jobType;
        string region;
        string emotionalTag;
        bool summoned;
        bool protected;
        bool sealed;
    }

    LaborEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonProtection(string memory workerName, string memory jobType, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(LaborEntry(workerName, jobType, region, emotionalTag, true, false, false));
    }

    function confirmProtection(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealLaborEntry(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getLaborEntry(uint256 index) external view returns (LaborEntry memory) {
        return entries[index];
    }
}
