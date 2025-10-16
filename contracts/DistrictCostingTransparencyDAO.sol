// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DistrictCostingTransparencyDAO {
    address public admin;

    struct CostingEntry {
        string districtLabel;
        string projectType;
        string costBreakdown;
        string emotionalTag;
        bool published;
    }

    CostingEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory districtLabel, string memory projectType, string memory costBreakdown, string memory emotionalTag) external onlyAdmin {
        entries.push(CostingEntry(districtLabel, projectType, costBreakdown, emotionalTag, false));
    }

    function publishEntry(uint256 index) external onlyAdmin {
        entries[index].published = true;
    }

    function getEntry(uint256 index) external view returns (CostingEntry memory) {
        return entries[index];
    }
}
