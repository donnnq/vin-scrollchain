// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DPWHConstructionDelayAuditGrid {
    address public admin;

    struct DelayEntry {
        string projectName;
        string region;
        string delayLayer; // "Procurement", "Site Access", "Budget Release"
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    DelayEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDelay(string memory projectName, string memory region, string memory delayLayer, string memory emotionalTag) external onlyAdmin {
        entries.push(DelayEntry(projectName, region, delayLayer, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealDelayEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getDelayEntry(uint256 index) external view returns (DelayEntry memory) {
        return entries[index];
    }
}
