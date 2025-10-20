// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataCenterLaborCodex {
    address public admin;

    struct LaborEntry {
        string region;
        string laborShortageType;
        string infrastructureImpact;
        string emotionalTag;
        bool summoned;
        bool audited;
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

    function summonLaborAudit(string memory region, string memory laborShortageType, string memory infrastructureImpact, string memory emotionalTag) external onlyAdmin {
        entries.push(LaborEntry(region, laborShortageType, infrastructureImpact, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealLaborEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getLaborEntry(uint256 index) external view returns (LaborEntry memory) {
        return entries[index];
    }
}
