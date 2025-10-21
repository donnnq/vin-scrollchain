// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodScamAuditDAO {
    address public admin;

    struct ScamEntry {
        string projectName;
        string region;
        string anomalyType; // "Overpricing", "Ghost Project", "Conflict of Interest"
        string emotionalTag;
        bool summoned;
        bool investigated;
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

    function summonScam(string memory projectName, string memory region, string memory anomalyType, string memory emotionalTag) external onlyAdmin {
        entries.push(ScamEntry(projectName, region, anomalyType, emotionalTag, true, false, false));
    }

    function confirmInvestigation(uint256 index) external onlyAdmin {
        entries[index].investigated = true;
    }

    function sealScamEntry(uint256 index) external onlyAdmin {
        require(entries[index].investigated, "Must be investigated first");
        entries[index].sealed = true;
    }

    function getScamEntry(uint256 index) external view returns (ScamEntry memory) {
        return entries[index];
    }
}
