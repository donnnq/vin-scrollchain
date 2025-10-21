// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DepEdFacilityRestorationProtocol {
    address public admin;

    struct RestorationEntry {
        string schoolName;
        string region;
        string damageType; // "Structural", "Electrical", "Sanitation"
        string emotionalTag;
        bool summoned;
        bool restored;
        bool sealed;
    }

    RestorationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRestoration(string memory schoolName, string memory region, string memory damageType, string memory emotionalTag) external onlyAdmin {
        entries.push(RestorationEntry(schoolName, region, damageType, emotionalTag, true, false, false));
    }

    function confirmRestoration(uint256 index) external onlyAdmin {
        entries[index].restored = true;
    }

    function sealRestorationEntry(uint256 index) external onlyAdmin {
        require(entries[index].restored, "Must be restored first");
        entries[index].sealed = true;
    }

    function getRestorationEntry(uint256 index) external view returns (RestorationEntry memory) {
        return entries[index];
    }
}
