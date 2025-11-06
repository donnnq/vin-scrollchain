// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FoodSovereigntyBroadcastProtocol {
    address public steward;

    struct SovereigntyEntry {
        string foodType;
        string originCountry;
        string broadcastProtocol;
        string emotionalTag;
    }

    SovereigntyEntry[] public registry;

    event FoodSovereigntyBroadcasted(string foodType, string originCountry, string broadcastProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastFood(
        string memory foodType,
        string memory originCountry,
        string memory broadcastProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(SovereigntyEntry(foodType, originCountry, broadcastProtocol, emotionalTag));
        emit FoodSovereigntyBroadcasted(foodType, originCountry, broadcastProtocol, emotionalTag);
    }
}
