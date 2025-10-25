// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InvestorToRedemptionProtocol {
    address public steward;

    struct RedemptionEntry {
        string fundName; // "UnionBank PHP Equity Fund"
        string investorID; // "Vinvin"
        string redemptionMethod; // "T+3 banking day settlement"
        string emotionalTag;
        bool requested;
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

    function requestRedemption(string memory fundName, string memory investorID, string memory redemptionMethod, string memory emotionalTag) external onlySteward {
        entries.push(RedemptionEntry(fundName, investorID, redemptionMethod, emotionalTag, true, false));
    }

    function sealRedemptionEntry(uint256 index) external onlySteward {
        require(entries[index].requested, "Must be requested first");
        entries[index].sealed = true;
    }

    function getRedemptionEntry(uint256 index) external view returns (RedemptionEntry memory) {
        return entries[index];
    }
}
