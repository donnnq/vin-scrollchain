// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FishToMarketDAO {
    address public steward;

    struct MarketEntry {
        string barangay;
        string fishType;
        string marketPartner;
        string emotionalTag;
    }

    MarketEntry[] public registry;

    event FishMarketTagged(string barangay, string fishType, string marketPartner, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagFishMarket(
        string memory barangay,
        string memory fishType,
        string memory marketPartner,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(MarketEntry(barangay, fishType, marketPartner, emotionalTag));
        emit FishMarketTagged(barangay, fishType, marketPartner, emotionalTag);
    }
}
