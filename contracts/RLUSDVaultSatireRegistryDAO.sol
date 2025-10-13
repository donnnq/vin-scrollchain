// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract RLUSDVaultSatireRegistryDAO {
    address public steward;

    struct SatireEvent {
        string vaultName;
        string satireType; // "Mock Yield Chart", "Animated Thread", "Parody PSA"
        string satireImpact; // "Amplified", "Flagged", "Resolved"
        string emotionalTag;
        uint256 timestamp;
    }

    SatireEvent[] public events;

    event SatireLogged(
        string vaultName,
        string satireType,
        string satireImpact,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log RLUSD vault satire rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logSatire(
        string memory vaultName,
        string memory satireType,
        string memory satireImpact,
        string memory emotionalTag
    ) external onlySteward {
        events.push(SatireEvent({
            vaultName: vaultName,
            satireType: satireType,
            satireImpact: satireImpact,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit SatireLogged(vaultName, satireType, satireImpact, emotionalTag, block.timestamp);
    }

    function getSatireByIndex(uint256 index) external view returns (
        string memory vaultName,
        string memory satireType,
        string memory satireImpact,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        SatireEvent memory s = events[index];
        return (
            s.vaultName,
            s.satireType,
            s.satireImpact,
            s.emotionalTag,
            s.timestamp
        );
    }
}
