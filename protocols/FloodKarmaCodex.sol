// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodKarmaCodex {
    address public admin;

    struct KarmaEntry {
        string region;
        string karmicTrigger;
        string auditClause;
        string emotionalTag;
        bool summoned;
        bool resolved;
        bool sealed;
    }

    KarmaEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonKarma(string memory region, string memory karmicTrigger, string memory auditClause, string memory emotionalTag) external onlyAdmin {
        entries.push(KarmaEntry(region, karmicTrigger, auditClause, emotionalTag, true, false, false));
    }

    function confirmResolution(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function sealKarmaEntry(uint256 index) external onlyAdmin {
        require(entries[index].resolved, "Must be resolved first");
        entries[index].sealed = true;
    }

    function getKarmaEntry(uint256 index) external view returns (KarmaEntry memory) {
        return entries[index];
    }
}
