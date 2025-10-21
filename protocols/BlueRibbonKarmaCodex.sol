// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BlueRibbonKarmaCodex {
    address public admin;

    struct KarmaEntry {
        string senatorName;
        string karmaType; // "Chair Bias", "Investigation Delay", "Conflict Shielding"
        string codexClause;
        string emotionalTag;
        bool summoned;
        bool audited;
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

    function summonKarma(string memory senatorName, string memory karmaType, string memory codexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(KarmaEntry(senatorName, karmaType, codexClause, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealKarmaEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getKarmaEntry(uint256 index) external view returns (KarmaEntry memory) {
        return entries[index];
    }
}
