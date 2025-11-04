// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InvestorConfidenceSignalIndex {
    address public steward;

    struct ConfidenceEntry {
        string sector;
        string signalType;
        string confidenceLevel;
        string emotionalTag;
    }

    ConfidenceEntry[] public index;

    event InvestorConfidenceIndexed(string sector, string signalType, string confidenceLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexConfidence(
        string memory sector,
        string memory signalType,
        string memory confidenceLevel,
        string memory emotionalTag
    ) public onlySteward {
        index.push(ConfidenceEntry(sector, signalType, confidenceLevel, emotionalTag));
        emit InvestorConfidenceIndexed(sector, signalType, confidenceLevel, emotionalTag);
    }
}
