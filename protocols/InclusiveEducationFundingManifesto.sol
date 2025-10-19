// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InclusiveEducationFundingManifesto {
    address public admin;

    struct FundingEntry {
        string region;
        string fundingPurpose;
        uint256 proposedAmount;
        string emotionalTag;
        bool summoned;
        bool endorsed;
        bool sealed;
    }

    FundingEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonFunding(string memory region, string memory fundingPurpose, uint256 proposedAmount, string memory emotionalTag) external onlyAdmin {
        entries.push(FundingEntry(region, fundingPurpose, proposedAmount, emotionalTag, true, false, false));
    }

    function confirmEndorsement(uint256 index) external onlyAdmin {
        entries[index].endorsed = true;
    }

    function sealFundingEntry(uint256 index) external onlyAdmin {
        require(entries[index].endorsed, "Must be endorsed first");
        entries[index].sealed = true;
    }

    function getFundingEntry(uint256 index) external view returns (FundingEntry memory) {
        return entries[index];
    }
}
