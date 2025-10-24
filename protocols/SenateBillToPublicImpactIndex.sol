// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateBillToPublicImpactIndex {
    address public steward;

    struct ImpactEntry {
        string billName; // "SB No. 63"
        string sponsor; // "Sen. Marcoleta"
        string projectedImpact; // "Expanded electricity discount", "VAT removal"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    ImpactEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexImpact(string memory billName, string memory sponsor, string memory projectedImpact, string memory emotionalTag) external onlySteward {
        entries.push(ImpactEntry(billName, sponsor, projectedImpact, emotionalTag, true, false));
    }

    function sealImpactEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getImpactEntry(uint256 index) external view returns (ImpactEntry memory) {
        return entries[index];
    }
}
