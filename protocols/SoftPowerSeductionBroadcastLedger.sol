// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SoftPowerSeductionBroadcastLedger {
    address public steward;

    struct BroadcastEntry {
        string timestamp;
        string originCountry;
        string seductionChannel;
        string allegianceEffect;
        string benevolentBrandingSignal;
        string influenceLaunderingTag;
    }

    BroadcastEntry[] public ledger;

    event SoftPowerBroadcasted(string timestamp, string originCountry, string seductionChannel, string allegianceEffect, string benevolentBrandingSignal, string influenceLaunderingTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastSoftPower(
        string memory timestamp,
        string memory originCountry,
        string memory seductionChannel,
        string memory allegianceEffect,
        string memory benevolentBrandingSignal,
        string memory influenceLaunderingTag
    ) public onlySteward {
        ledger.push(BroadcastEntry(timestamp, originCountry, seductionChannel, allegianceEffect, benevolentBrandingSignal, influenceLaunderingTag));
        emit SoftPowerBroadcasted(timestamp, originCountry, seductionChannel, allegianceEffect, benevolentBrandingSignal, influenceLaunderingTag);
    }
}
