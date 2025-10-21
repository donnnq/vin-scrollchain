// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EvidenceTamperingAuditGrid {
    address public admin;

    struct TamperingEntry {
        string caseName;
        string evidenceType; // "Surveillance Footage", "DNA Sample", "Witness Statement"
        string tamperingLayer; // "Missing File", "Altered Record", "Chain Break"
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    TamperingEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTampering(string memory caseName, string memory evidenceType, string memory tamperingLayer, string memory emotionalTag) external onlyAdmin {
        entries.push(TamperingEntry(caseName, evidenceType, tamperingLayer, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealTamperingEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getTamperingEntry(uint256 index) external view returns (TamperingEntry memory) {
        return entries[index];
    }
}
