// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AntiHoardingSignalIndex {
    address public steward;

    struct SignalEntry {
        string commodity;
        string location;
        string hoardingSignal;
        string emotionalTag;
    }

    SignalEntry[] public index;

    event AntiHoardingSignalTagged(string commodity, string location, string hoardingSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSignal(
        string memory commodity,
        string memory location,
        string memory hoardingSignal,
        string memory emotionalTag
    ) public onlySteward {
        index.push(SignalEntry(commodity, location, hoardingSignal, emotionalTag));
        emit AntiHoardingSignalTagged(commodity, location, hoardingSignal, emotionalTag);
    }
}
