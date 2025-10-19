// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SubsidyTransparencyCodex {
    address public admin;

    struct SubsidyEntry {
        string subsidyName;
        string fundingSource;
        string deliveryChannel;
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

    function summonSubsidy(string memory subsidyName, string memory fundingSource, string memory deliveryChannel, string memory emotionalTag) external onlyAdmin {
        entries.push(SubsidyEntry(subsidyName, fundingSource, deliveryChannel, emotionalTag, true, false, false));
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
