// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MemePoweredCyberAlertProtocolDAO {
    address public steward;

    struct AlertEvent {
        string memeTitle;
        string threatType; // "Phishing", "Infrastructure Breach", "Surveillance"
        string alertLevel; // "Low", "Moderate", "Critical"
        string emotionalTag;
        uint256 timestamp;
    }

    AlertEvent[] public events;

    event AlertLogged(
        string memeTitle,
        string threatType,
        string alertLevel,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log meme-powered cyber alerts");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logAlert(
        string memory memeTitle,
        string memory threatType,
        string memory alertLevel,
        string memory emotionalTag
    ) external onlySteward {
        events.push(AlertEvent({
            memeTitle: memeTitle,
            threatType: threatType,
            alertLevel: alertLevel,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit AlertLogged(memeTitle, threatType, alertLevel, emotionalTag, block.timestamp);
    }

    function getAlertByIndex(uint256 index) external view returns (
        string memory memeTitle,
        string memory threatType,
        string memory alertLevel,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        AlertEvent memory a = events[index];
        return (
            a.memeTitle,
            a.threatType,
            a.alertLevel,
            a.emotionalTag,
            a.timestamp
        );
    }
}
