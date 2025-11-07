// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FedNarrativeVolatilityDAO {
    address public steward;

    struct NarrativeEvent {
        string signalType;
        string timestamp;
        string assetImpacted;
        string volatilityScore;
        string emotionalTag;
    }

    NarrativeEvent[] public events;

    event FedNarrativeLogged(string signalType, string timestamp, string assetImpacted, string volatilityScore, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logNarrative(
        string memory signalType,
        string memory timestamp,
        string memory assetImpacted,
        string memory volatilityScore,
        string memory emotionalTag
    ) public onlySteard {
        events.push(NarrativeEvent(signalType, timestamp, assetImpacted, volatilityScore, emotionalTag));
        emit FedNarrativeLogged(signalType, timestamp, assetImpacted, volatilityScore, emotionalTag);
    }
}
