// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthLedCreditRatingProtocol {
    address public admin;

    struct RatingEntry {
        string youthCouncilName;
        string countryName;
        string proposedRating;
        string emotionalTag;
        bool summoned;
        bool endorsed;
        bool sealed;
    }

    RatingEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRating(string memory youthCouncilName, string memory countryName, string memory proposedRating, string memory emotionalTag) external onlyAdmin {
        entries.push(RatingEntry(youthCouncilName, countryName, proposedRating, emotionalTag, true, false, false));
    }

    function confirmEndorsement(uint256 index) external onlyAdmin {
        entries[index].endorsed = true;
    }

    function sealRatingEntry(uint256 index) external onlyAdmin {
        require(entries[index].endorsed, "Must be endorsed first");
        entries[index].sealed = true;
    }

    function getRatingEntry(uint256 index) external view returns (RatingEntry memory) {
        return entries[index];
    }
}
