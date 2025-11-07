// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryCryptoCrisisContainmentProtocol {
    address public steward;

    struct CrisisEntry {
        string protocolName;
        string timestamp;
        string crisisType;
        string containmentStrategy;
        string emotionalTag;
    }

    CrisisEntry[] public protocol;

    event CryptoCrisisContained(string protocolName, string timestamp, string crisisType, string containmentStrategy, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containCrisis(
        string memory protocolName,
        string memory timestamp,
        string memory crisisType,
        string memory containmentStrategy,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(CrisisEntry(protocolName, timestamp, crisisType, containmentStrategy, emotionalTag));
        emit CryptoCrisisContained(protocolName, timestamp, crisisType, containmentStrategy, emotionalTag);
    }
}
