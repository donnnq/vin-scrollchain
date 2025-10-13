// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title LiquidationCrashAuditDAO
 * @dev Emotionally tagged smart contract to log exploit events,
 * asset drops, and recovery rituals — scrollchain-sealed consequence.
 */

contract LiquidationCrashAuditDAO {
    address public steward;

    struct CrashEvent {
        address initiator;
        string exchange;
        string asset;
        uint256 dropPercent;
        string exploitType;
        string emotionalTag;
        uint256 timestamp;
    }

    CrashEvent[] public events;

    event CrashLogged(address indexed initiator, string exchange, string asset, uint256 dropPercent, string exploitType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log liquidation crashes");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logCrash(address initiator, string memory exchange, string memory asset, uint256 dropPercent, string memory exploitType, string memory emotionalTag) external onlySteward {
        events.push(CrashEvent({
            initiator: initiator,
            exchange: exchange,
            asset: asset,
            dropPercent: dropPercent,
            exploitType: exploitType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit CrashLogged(initiator, exchange, asset, dropPercent, exploitType, emotionalTag, block.timestamp);
    }

    function getCrashByIndex(uint256 index) external view returns (address initiator, string memory exchange, string memory asset, uint256 dropPercent, string memory exploitType, string memory emotionalTag, uint256 timestamp) {
        require(index < events.length, "Scrollstorm index out of bounds");
        CrashEvent memory e = events[index];
        return (e.initiator, e.exchange, e.asset, e.dropPercent, e.exploitType, e.emotionalTag, e.timestamp);
    }
}
