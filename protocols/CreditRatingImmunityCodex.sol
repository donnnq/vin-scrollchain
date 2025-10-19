// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CreditRatingImmunityCodex {
    address public admin;

    struct RatingEntry {
        string agencyName;
        string riskType;
        string emotionalTag;
        bool summoned;
        bool protected;
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

    function summonRatingProtection(string memory agencyName, string memory riskType, string memory emotionalTag) external onlyAdmin {
        entries.push(RatingEntry(agencyName, riskType, emotionalTag, true, false, false));
    }

    function confirmProtection(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealRatingEntry(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getRatingEntry(uint256 index) external view returns (RatingEntry memory) {
        return entries[index];
    }
}
