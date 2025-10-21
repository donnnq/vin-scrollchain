// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PigButcheringScamAuditGrid {
    address public admin;

    struct ScamEntry {
        string scamName;
        string originRegion; // "Cambodia", "Southeast Asia", etc.
        string manipulationLayer; // "Romantic Lure", "Fake Investment", "Social Engineering"
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    ScamEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonScam(string memory scamName, string memory originRegion, string memory manipulationLayer, string memory emotionalTag) external onlyAdmin {
        entries.push(ScamEntry(scamName, originRegion, manipulationLayer, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealScamEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getScamEntry(uint256 index) external view returns (ScamEntry memory) {
        return entries[index];
    }
}
