// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FoodTransportSubsidyCodex {
    address public admin;

    struct SubsidyEntry {
        string region;
        string subsidyType;
        string targetGroup;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    SubsidyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSubsidy(string memory region, string memory subsidyType, string memory targetGroup, string memory emotionalTag) external onlyAdmin {
        entries.push(SubsidyEntry(region, subsidyType, targetGroup, emotionalTag, true, false, false));
    }

    function verifySubsidy(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealSubsidy(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getSubsidyEntry(uint256 index) external view returns (SubsidyEntry memory) {
        return entries[index];
    }
}
