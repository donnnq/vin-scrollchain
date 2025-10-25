// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InvestmentToMercyAssetProtocol {
    address public steward;

    struct MercyEntry {
        string assetType; // "Ghost city unit", "Vacant tower"
        string ownershipStatus; // "Untracked", "Diaspora-linked"
        string repurposeGoal; // "Housing poor", "Sanctuary deployment"
        string emotionalTag;
        bool converted;
        bool sealed;
    }

    MercyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function convertAsset(string memory assetType, string memory ownershipStatus, string memory repurposeGoal, string memory emotionalTag) external onlySteward {
        entries.push(MercyEntry(assetType, ownershipStatus, repurposeGoal, emotionalTag, true, false));
    }

    function sealMercyEntry(uint256 index) external onlySteward {
        require(entries[index].converted, "Must be converted first");
        entries[index].sealed = true;
    }

    function getMercyEntry(uint256 index) external view returns (MercyEntry memory) {
        return entries[index];
    }
}
