// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InflationLinkedWageFirewall {
    address public admin;

    struct WageEntry {
        string region;
        string sector;
        string adjustmentType;
        string emotionalTag;
        bool summoned;
        bool protected;
        bool sealed;
    }

    WageEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonWage(string memory region, string memory sector, string memory adjustmentType, string memory emotionalTag) external onlyAdmin {
        entries.push(WageEntry(region, sector, adjustmentType, emotionalTag, true, false, false));
    }

    function confirmProtection(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealWage(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getWageEntry(uint256 index) external view returns (WageEntry memory) {
        return entries[index];
    }
}
