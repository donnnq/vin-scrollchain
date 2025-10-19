// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HomelessSelfRelianceDAO {
    address public admin;

    struct SupportEntry {
        string region;
        string supportType;
        string reintegrationPath;
        string emotionalTag;
        bool summoned;
        bool activated;
        bool sealed;
    }

    SupportEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSupport(string memory region, string memory supportType, string memory reintegrationPath, string memory emotionalTag) external onlyAdmin {
        entries.push(SupportEntry(region, supportType, reintegrationPath, emotionalTag, true, false, false));
    }

    function confirmActivation(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function sealSupportEntry(uint256 index) external onlyAdmin {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getSupportEntry(uint256 index) external view returns (SupportEntry memory) {
        return entries[index];
    }
}
