// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommercialRealEstateDoomCodex {
    address public admin;

    struct DoomEntry {
        string region;
        string loanType;
        string doomClause;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    DoomEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDoom(string memory region, string memory loanType, string memory doomClause, string memory emotionalTag) external onlyAdmin {
        entries.push(DoomEntry(region, loanType, doomClause, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealDoomEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getDoomEntry(uint256 index) external view returns (DoomEntry memory) {
        return entries[index];
    }
}
