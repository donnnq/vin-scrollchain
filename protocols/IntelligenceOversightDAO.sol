// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IntelligenceOversightDAO {
    address public admin;

    struct OversightEntry {
        string agency;
        string oversightClause;
        string geopoliticalTrigger;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    OversightEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonOversight(string memory agency, string memory oversightClause, string memory geopoliticalTrigger, string memory emotionalTag) external onlyAdmin {
        entries.push(OversightEntry(agency, oversightClause, geopoliticalTrigger, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealOversightEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getOversightEntry(uint256 index) external view returns (OversightEntry memory) {
        return entries[index];
    }
}
