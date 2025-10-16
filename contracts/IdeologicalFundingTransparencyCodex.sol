// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IdeologicalFundingTransparencyCodex {
    address public admin;

    struct FundingEntry {
        string recipientLabel;
        string fundingSource;
        string emotionalTag;
        bool disclosed;
        bool flagged;
    }

    FundingEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitFunding(string memory recipientLabel, string memory fundingSource, string memory emotionalTag) external onlyAdmin {
        entries.push(FundingEntry(recipientLabel, fundingSource, emotionalTag, false, false));
    }

    function discloseFunding(uint256 index) external onlyAdmin {
        entries[index].disclosed = true;
    }

    function flagFunding(uint256 index) external onlyAdmin {
        entries[index].flagged = true;
    }

    function getFunding(uint256 index) external view returns (FundingEntry memory) {
        return entries[index];
    }
}
