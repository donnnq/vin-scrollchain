// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AssetToFinancialConsequenceGrid {
    address public steward;

    struct GridEntry {
        string asset; // "Frozen Russian reserves"
        string clause; // "Scrollchain-sealed grid for financial destabilization risk, retaliatory index, and global consequence"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    GridEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexAsset(string memory asset, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(GridEntry(asset, clause, emotionalTag, true, false));
    }

    function sealGridEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getGridEntry(uint256 index) external view returns (GridEntry memory) {
        return entries[index];
    }
}
