// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CCTVReviewConsentCodexDAO {
    address public admin;

    struct ReviewEntry {
        string footageLabel;
        string reviewClause;
        string emotionalTag;
        bool approved;
    }

    ReviewEntry[] public reviews;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory footageLabel, string memory reviewClause, string memory emotionalTag) external onlyAdmin {
        reviews.push(ReviewEntry(footageLabel, reviewClause, emotionalTag, false));
    }

    function approveEntry(uint256 index) external onlyAdmin {
        reviews[index].approved = true;
    }

    function getEntry(uint256 index) external view returns (ReviewEntry memory) {
        return reviews[index];
    }
}
