// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TenantRightsCodex {
    address public admin;

    struct RightsEntry {
        string tenantName;
        string housingType;
        string grievanceType;
        string emotionalTag;
        bool summoned;
        bool resolved;
        bool sealed;
    }

    RightsEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonGrievance(string memory tenantName, string memory housingType, string memory grievanceType, string memory emotionalTag) external onlyAdmin {
        entries.push(RightsEntry(tenantName, housingType, grievanceType, emotionalTag, true, false, false));
    }

    function confirmResolution(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function sealRightsEntry(uint256 index) external onlyAdmin {
        require(entries[index].resolved, "Must be resolved first");
        entries[index].sealed = true;
    }

    function getRightsEntry(uint256 index) external view returns (RightsEntry memory) {
        return entries[index];
    }
}
