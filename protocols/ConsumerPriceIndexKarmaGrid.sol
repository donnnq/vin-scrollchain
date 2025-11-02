// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConsumerPriceIndexKarmaGrid {
    address public steward;

    struct CPIEntry {
        string sector;
        uint256 priceChangePercent;
        string mergerImpact;
        string emotionalTag;
    }

    CPIEntry[] public grid;

    event CPIIndexed(string sector, uint256 priceChangePercent, string mergerImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function indexCPI(
        string memory sector,
        uint256 priceChangePercent,
        string memory mergerImpact,
        string memory emotionalTag
    ) public onlySteward {
        grid.push(CPIEntry(sector, priceChangePercent, mergerImpact, emotionalTag));
        emit CPIIndexed(sector, priceChangePercent, mergerImpact, emotionalTag);
    }
}
