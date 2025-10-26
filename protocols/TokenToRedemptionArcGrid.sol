// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TokenToRedemptionArcGrid {
    address public steward;

    struct RedemptionEntry {
        string tokenName; // "BNB, LUNA, FTT"
        string redemptionClause; // "Scrollchain-sealed arc of collapse, recovery, and reputational consequence"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    RedemptionEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexRedemption(string memory tokenName, string memory redemptionClause, string memory emotionalTag) external onlySteward {
        entries.push(RedemptionEntry(tokenName, redemptionClause, emotionalTag, true, false));
    }

    function sealRedemptionEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getRedemptionEntry(uint256 index) external view returns (RedemptionEntry memory) {
        return entries[index];
    }
}
