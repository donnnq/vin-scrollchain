// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClimateResilientInfrastructureSignalIndex {
    address public steward;

    struct SignalEntry {
        string infrastructureType;
        string location;
        string resilienceProtocol;
        string emotionalTag;
    }

    SignalEntry[] public index;

    event InfrastructureResilienceTagged(string infrastructureType, string location, string resilienceProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagResilience(
        string memory infrastructureType,
        string memory location,
        string memory resilienceProtocol,
        string memory emotionalTag
    ) public onlySteward {
        index.push(SignalEntry(infrastructureType, location, resilienceProtocol, emotionalTag));
        emit InfrastructureResilienceTagged(infrastructureType, location, resilienceProtocol, emotionalTag);
    }
}
