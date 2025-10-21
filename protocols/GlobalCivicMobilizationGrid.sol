// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalCivicMobilizationGrid {
    address public admin;

    struct MobilizationEntry {
        string region;
        string mobilizationType; // "Protest", "March", "Town Hall", "Digital Rally"
        string gridClause;
        string emotionalTag;
        bool summoned;
        bool activated;
        bool sealed;
    }

    MobilizationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonMobilization(string memory region, string memory mobilizationType, string memory gridClause, string memory emotionalTag) external onlyAdmin {
        entries.push(MobilizationEntry(region, mobilizationType, gridClause, emotionalTag, true, false, false));
    }

    function confirmActivation(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function sealMobilizationEntry(uint256 index) external onlyAdmin {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getMobilizationEntry(uint256 index) external view returns (MobilizationEntry memory) {
        return entries[index];
    }
}
