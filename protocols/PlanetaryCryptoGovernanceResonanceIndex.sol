// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryCryptoGovernanceResonanceIndex {
    address public steward;

    struct ResonanceEntry {
        string protocolName;
        string timestamp;
        uint256 governanceScore;
        string resonanceSignal;
        string emotionalTag;
    }

    ResonanceEntry[] public index;

    event GovernanceResonanceLogged(string protocolName, string timestamp, uint256 governanceScore, string resonanceSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logResonance(
        string memory protocolName,
        string memory timestamp,
        uint256 governanceScore,
        string memory resonanceSignal,
        string memory emotionalTag
    ) public onlySteward {
        index.push(ResonanceEntry(protocolName, timestamp, governanceScore, resonanceSignal, emotionalTag));
        emit GovernanceResonanceLogged(protocolName, timestamp, governanceScore, resonanceSignal, emotionalTag);
    }
}
