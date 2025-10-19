// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FarmerLedTreatyReviewDAO {
    address public admin;

    struct ReviewEntry {
        string treatyName;
        string farmerName;
        string concernType;
        string emotionalTag;
        bool summoned;
        bool reviewed;
        bool sealed;
    }

    ReviewEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonReview(string memory treatyName, string memory farmerName, string memory concernType, string memory emotionalTag) external onlyAdmin {
        entries.push(ReviewEntry(treatyName, farmerName, concernType, emotionalTag, true, false, false));
    }

    function confirmReview(uint256 index) external onlyAdmin {
        entries[index].reviewed = true;
    }

    function sealReviewEntry(uint256 index) external onlyAdmin {
        require(entries[index].reviewed, "Must be reviewed first");
        entries[index].sealed = true;
    }

    function getReviewEntry(uint256 index) external view returns (ReviewEntry memory) {
        return entries[index];
    }
}
