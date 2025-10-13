// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TruthTellingMediaRegistryDAO {
    address public steward;

    struct MediaEvent {
        string outletName; // "Rappler", "CryptoSlate", "BBC"
        string truthSignal; // "Verified Footage", "Whistleblower Report", "Live Stream Audit"
        string registryStatus; // "Trusted", "Flagged", "Amplified"
        string emotionalTag;
        uint256 timestamp;
    }

    MediaEvent[] public events;

    event MediaLogged(
        string outletName,
        string truthSignal,
        string registryStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only Vinvin may log truth-telling media rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logMedia(
        string memory outletName,
        string memory truthSignal,
        string memory registryStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(MediaEvent({
            outletName: outletName,
            truthSignal: truthSignal,
            registryStatus: registryStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit MediaLogged(outletName, truthSignal, registryStatus, emotionalTag, block.timestamp);
    }
}
