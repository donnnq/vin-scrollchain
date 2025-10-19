// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RegionalCostOfLivingDAO {
    address public admin;

    struct CostEntry {
        string region;
        string sector;
        string wageAdjustmentType;
        string emotionalTag;
        bool summoned;
        bool adjusted;
        bool sealed;
    }

    CostEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAdjustment(string memory region, string memory sector, string memory wageAdjustmentType, string memory emotionalTag) external onlyAdmin {
        entries.push(CostEntry(region, sector, wageAdjustmentType, emotionalTag, true, false, false));
    }

    function confirmAdjustment(uint256 index) external onlyAdmin {
        entries[index].adjusted = true;
    }

    function sealAdjustment(uint256 index) external onlyAdmin {
        require(entries[index].adjusted, "Must be adjusted first");
        entries[index].sealed = true;
    }

    function getCostEntry(uint256 index) external view returns (CostEntry memory) {
        return entries[index];
    }
}
