// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FemaleFounderFundingDAO {
    address public admin;

    struct FundingEntry {
        string founderLabel;
        string fundingClause;
        string emotionalTag;
        bool approved;
    }

    FundingEntry[] public funding;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _founderLabel, string memory _fundingClause, string memory _emotionalTag) external onlyAdmin {
        funding.push(FundingEntry(_founderLabel, _fundingClause, _emotionalTag, false));
    }

    function approveEntry(uint256 index) external onlyAdmin {
        funding[index].approved = true;
    }

    function getEntry(uint256 index) external view returns (FundingEntry memory) {
        return funding[index];
    }
}
