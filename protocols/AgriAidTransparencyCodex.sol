// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AgriAidTransparencyCodex {
    address public admin;

    struct AidEntry {
        string region;
        string aidType;
        uint256 amount;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    AidEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAidAudit(string memory region, string memory aidType, uint256 amount, string memory emotionalTag) external onlyAdmin {
        entries.push(AidEntry(region, aidType, amount, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealAidAudit(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getAidEntry(uint256 index) external view returns (AidEntry memory) {
        return entries[index];
    }
}
