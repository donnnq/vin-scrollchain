// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ToolAccessEquityDAO {
    address public admin;

    struct ToolEntry {
        string toolName;
        string accessZone;
        string equityType;
        string emotionalTag;
        bool summoned;
        bool distributed;
        bool sealed;
    }

    ToolEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonToolAccess(string memory toolName, string memory accessZone, string memory equityType, string memory emotionalTag) external onlyAdmin {
        entries.push(ToolEntry(toolName, accessZone, equityType, emotionalTag, true, false, false));
    }

    function confirmDistribution(uint256 index) external onlyAdmin {
        entries[index].distributed = true;
    }

    function sealToolAccess(uint256 index) external onlyAdmin {
        require(entries[index].distributed, "Must be distributed first");
        entries[index].sealed = true;
    }

    function getToolEntry(uint256 index) external view returns (ToolEntry memory) {
        return entries[index];
    }
}
