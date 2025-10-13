// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title TraderProtectionDAO
 * @dev Emotionally tagged smart contract to log trade events,
 * breach flags, and insurance rituals — scrollchain-sealed consequence.
 */

contract TraderProtectionDAO {
    address public steward;

    struct TradeEvent {
        address initiator;
        string platform;
        string asset;
        uint256 amount;
        string riskLevel; // "Low", "Moderate", "High"
        string emotionalTag;
        uint256 timestamp;
    }

    TradeEvent[] public trades;

    event TradeLogged(address indexed initiator, string platform, string asset, uint256 amount, string riskLevel, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log trade protection rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logTrade(address initiator, string memory platform, string memory asset, uint256 amount, string memory riskLevel, string memory emotionalTag) external onlySteward {
        trades.push(TradeEvent({
            initiator: initiator,
            platform: platform,
            asset: asset,
            amount: amount,
            riskLevel: riskLevel,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit TradeLogged(initiator, platform, asset, amount, riskLevel, emotionalTag, block.timestamp);
    }

    function getTradeByIndex(uint256 index) external view returns (address initiator, string memory platform, string memory asset, uint256 amount, string memory riskLevel, string memory emotionalTag, uint256 timestamp) {
        require(index < trades.length, "Scrollstorm index out of bounds");
        TradeEvent memory t = trades[index];
        return (t.initiator, t.platform, t.asset, t.amount, t.riskLevel, t.emotionalTag, t.timestamp);
    }
}
