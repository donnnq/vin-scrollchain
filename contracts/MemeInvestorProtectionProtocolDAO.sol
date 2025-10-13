// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MemeInvestorProtectionProtocolDAO {
    address public steward;

    struct ProtectionEvent {
        string memeTitle;
        string marketTrigger; // "Crash Warning", "Bubble Signal", "Liquidity Stress"
        string protectionAction; // "Parody PSA", "Animated Alert", "Satire Buffer"
        string emotionalTag;
        uint256 timestamp;
    }

    ProtectionEvent[] public events;

    event ProtectionLogged(
        string memeTitle,
        string marketTrigger,
        string protectionAction,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log meme-powered investor protection rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logProtection(
        string memory memeTitle,
        string memory marketTrigger,
        string memory protectionAction,
        string memory emotionalTag
    ) external onlySteward {
        events.push(ProtectionEvent({
            memeTitle: memeTitle,
            marketTrigger: marketTrigger,
            protectionAction: protectionAction,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit ProtectionLogged(memeTitle, marketTrigger, protectionAction, emotionalTag, block.timestamp);
    }

    function getProtectionByIndex(uint256 index) external view returns (
        string memory memeTitle,
        string memory marketTrigger,
        string memory protectionAction,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        ProtectionEvent memory p = events[index];
        return (
            p.memeTitle,
            p.marketTrigger,
            p.protectionAction,
            p.emotionalTag,
            p.timestamp
        );
    }
}
