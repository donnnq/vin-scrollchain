// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UtilityReliefCodex {
    address public admin;

    struct UtilityEntry {
        string utilityType;
        string region;
        string emotionalTag;
        bool summoned;
        bool discounted;
        bool sealed;
    }

    UtilityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonUtility(string memory utilityType, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(UtilityEntry(utilityType, region, emotionalTag, true, false, false));
    }

    function discountUtility(uint256 index) external onlyAdmin {
        entries[index].discounted = true;
    }

    function sealRelief(uint256 index) external onlyAdmin {
        require(entries[index].discounted, "Must be discounted first");
        entries[index].sealed = true;
    }

    function getUtilityEntry(uint256 index) external view returns (UtilityEntry memory) {
        return entries[index];
    }
}
