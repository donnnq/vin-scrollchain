// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RiverPerformanceDAO {
    address public admin;

    struct PerformanceEntry {
        string dockName;
        string artistGroup;
        string performanceType;
        string emotionalTag;
        bool summoned;
        bool performed;
        bool sealed;
    }

    PerformanceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonPerformance(string memory dockName, string memory artistGroup, string memory performanceType, string memory emotionalTag) external onlyAdmin {
        entries.push(PerformanceEntry(dockName, artistGroup, performanceType, emotionalTag, true, false, false));
    }

    function confirmPerformance(uint256 index) external onlyAdmin {
        entries[index].performed = true;
    }

    function sealPerformanceEntry(uint256 index) external onlyAdmin {
        require(entries[index].performed, "Must be performed first");
        entries[index].sealed = true;
    }

    function getPerformanceEntry(uint256 index) external view returns (PerformanceEntry memory) {
        return entries[index];
    }
}
