// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PriceMonitoringBroadcastGrid {
    address public steward;

    struct PriceEntry {
        string itemName;
        uint256 currentPrice;
        string location;
        string emotionalTag;
    }

    PriceEntry[] public grid;

    event PriceBroadcasted(string itemName, uint256 currentPrice, string location, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastPrice(
        string memory itemName,
        uint256 currentPrice,
        string memory location,
        string memory emotionalTag
    ) public onlySteward {
        grid.push(PriceEntry(itemName, currentPrice, location, emotionalTag));
        emit PriceBroadcasted(itemName, currentPrice, location, emotionalTag);
    }
}
