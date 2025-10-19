// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthHousingDAO {
    address public admin;

    struct HousingEntry {
        string tenantName;
        string region;
        string housingType;
        string emotionalTag;
        bool summoned;
        bool allocated;
        bool sealed;
    }

    HousingEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonHousing(string memory tenantName, string memory region, string memory housingType, string memory emotionalTag) external onlyAdmin {
        entries.push(HousingEntry(tenantName, region, housingType, emotionalTag, true, false, false));
    }

    function confirmAllocation(uint256 index) external onlyAdmin {
        entries[index].allocated = true;
    }

    function sealHousingEntry(uint256 index) external onlyAdmin {
        require(entries[index].allocated, "Must be allocated first");
        entries[index].sealed = true;
    }

    function getHousingEntry(uint256 index) external view returns (HousingEntry memory) {
        return entries[index];
    }
}
