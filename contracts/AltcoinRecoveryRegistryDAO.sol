// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract AltcoinRecoveryRegistryDAO {
    address public steward;

    struct RecoveryEvent {
        string tokenName;
        string reboundPercentage;
        string catalyst; // "AI Narrative", "Technical Bounce", "Institutional Buy"
        string emotionalTag;
        uint256 timestamp;
    }

    RecoveryEvent[] public events;

    event RecoveryLogged(
        string tokenName,
        string reboundPercentage,
        string catalyst,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log altcoin recovery rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logRecovery(
        string memory tokenName,
        string memory reboundPercentage,
        string memory catalyst,
        string memory emotionalTag
    ) external onlySteward {
        events.push(RecoveryEvent({
            tokenName: tokenName,
            reboundPercentage: reboundPercentage,
            catalyst: catalyst,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit RecoveryLogged(tokenName, reboundPercentage, catalyst, emotionalTag, block.timestamp);
    }

    function getRecoveryByIndex(uint256 index) external view returns (
        string memory tokenName,
        string memory reboundPercentage,
        string memory catalyst,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        RecoveryEvent memory r = events[index];
        return (
            r.tokenName,
            r.reboundPercentage,
            r.catalyst,
            r.emotionalTag,
            r.timestamp
        );
    }
}
