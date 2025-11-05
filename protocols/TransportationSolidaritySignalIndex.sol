// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TransportationSolidaritySignalIndex {
    address public steward;

    struct SignalEntry {
        string route;
        uint256 kilometers;
        string solidaritySignal;
        string emotionalTag;
    }

    SignalEntry[] public index;

    event TransportationSolidarityTagged(string route, uint256 kilometers, string solidaritySignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSolidarity(
        string memory route,
        uint256 kilometers,
        string memory solidaritySignal,
        string memory emotionalTag
    ) public onlySteward {
        index.push(SignalEntry(route, kilometers, solidaritySignal, emotionalTag));
        emit TransportationSolidarityTagged(route, kilometers, solidaritySignal, emotionalTag);
    }
}
