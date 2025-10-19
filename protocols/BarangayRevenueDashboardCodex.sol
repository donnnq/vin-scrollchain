// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayRevenueDashboardCodex {
    address public admin;

    struct DashboardEntry {
        string barangayName;
        string fiscalYear;
        string dashboardType;
        string emotionalTag;
        bool summoned;
        bool deployed;
        bool sealed;
    }

    DashboardEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDashboard(string memory barangayName, string memory fiscalYear, string memory dashboardType, string memory emotionalTag) external onlyAdmin {
        entries.push(DashboardEntry(barangayName, fiscalYear, dashboardType, emotionalTag, true, false, false));
    }

    function confirmDeployment(uint256 index) external onlyAdmin {
        entries[index].deployed = true;
    }

    function sealDashboardEntry(uint256 index) external onlyAdmin {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getDashboardEntry(uint256 index) external view returns (DashboardEntry memory) {
        return entries[index];
    }
}
