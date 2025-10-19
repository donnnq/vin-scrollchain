// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CreativeSovereigntyCodex {
    address public admin;

    struct CreativeEntry {
        string creatorName;
        string medium;
        string sovereigntyType;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    CreativeEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonCreative(string memory creatorName, string memory medium, string memory sovereigntyType, string memory emotionalTag) external onlyAdmin {
        entries.push(CreativeEntry(creatorName, medium, sovereigntyType, emotionalTag, true, false, false));
    }

    function verifyCreative(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealCreative(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getCreativeEntry(uint256 index) external view returns (CreativeEntry memory) {
        return entries[index];
    }
}
