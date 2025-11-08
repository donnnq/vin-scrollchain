// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HeatMitigationSignalAmplifier {
    address public steward;

    struct SignalEntry {
        string timestamp;
        string interventionType;
        string location;
        string temperatureReductionEstimate;
        string climateResilienceSignal;
        string emotionalTag;
    }

    SignalEntry[] public index;

    event HeatMitigationSignalAmplified(string timestamp, string interventionType, string location, string temperatureReductionEstimate, string climateResilienceSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function amplifySignal(
        string memory timestamp,
        string memory interventionType,
        string memory location,
        string memory temperatureReductionEstimate,
        string memory climateResilienceSignal,
        string memory emotionalTag
    ) public onlySteward {
        index.push(SignalEntry(timestamp, interventionType, location, temperatureReductionEstimate, climateResilienceSignal, emotionalTag));
        emit HeatMitigationSignalAmplified(timestamp, interventionType, location, temperatureReductionEstimate, climateResilienceSignal, emotionalTag);
    }
}
