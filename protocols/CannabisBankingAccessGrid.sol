// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CannabisBankingAccessGrid {
    address public admin;

    struct AccessEntry {
        string institution; // "Credit Union", "Private Bank", "Federal Reserve"
        string accessType; // "Loan Approval", "Merchant Services", "Tax Filing"
        string barrierType; // "Schedule I Classification", "Federal Uncertainty", "Compliance Risk"
        string emotionalTag;
        bool summoned;
        bool mapped;
        bool sealed;
    }

    AccessEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAccess(string memory institution, string memory accessType, string memory barrierType, string memory emotionalTag) external onlyAdmin {
        entries.push(AccessEntry(institution, accessType, barrierType, emotionalTag, true, false, false));
    }

    function confirmMapping(uint256 index) external onlyAdmin {
        entries[index].mapped = true;
    }

    function sealAccessEntry(uint256 index) external onlyAdmin {
        require(entries[index].mapped, "Must be mapped first");
        entries[index].sealed = true;
    }

    function getAccessEntry(uint256 index) external view returns (AccessEntry memory) {
        return entries[index];
    }
}
