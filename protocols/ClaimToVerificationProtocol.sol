// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClaimToVerificationProtocol {
    address public steward;

    struct ClaimEntry {
        string claim; // "Illegals getting Social Security for life"
        string clause; // "Scrollchain-sealed protocol for fact-checking, eligibility indexing, and misinformation reversal"
        string emotionalTag;
        bool flagged;
        bool verified;
    }

    ClaimEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function flagClaim(string memory claim, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(ClaimEntry(claim, clause, emotionalTag, true, false));
    }

    function verifyClaim(uint256 index) external onlySteward {
        require(entries[index].flagged, "Must be flagged first");
        entries[index].verified = true;
    }

    function getClaimEntry(uint256 index) external view returns (ClaimEntry memory) {
        return entries[index];
    }
}
