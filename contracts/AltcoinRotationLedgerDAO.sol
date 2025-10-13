// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title AltcoinRotationLedgerDAO
 * @dev Emotionally tagged smart contract to log ETH-led rotations,
 * high-beta surges, and altcoin momentum rituals — scrollchain-sealed volatility.
 */

contract AltcoinRotationLedgerDAO {
    address public steward;

    struct RotationEvent {
        address initiator;
        string leadingAsset;
        string rotatedAsset;
        uint256 percentGain;
        string emotionalTag;
        uint256 timestamp;
    }

    RotationEvent[] public events;

    event RotationLogged(address indexed initiator, string leadingAsset, string rotatedAsset, uint256 percentGain, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log altcoin rotations");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logRotation(address initiator, string memory leadingAsset, string memory rotatedAsset, uint256 percentGain, string memory emotionalTag) external onlySteward {
        events.push(RotationEvent({
            initiator: initiator,
            leadingAsset: leadingAsset,
            rotatedAsset: rotatedAsset,
            percentGain: percentGain,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit RotationLogged(initiator, leadingAsset, rotatedAsset, percentGain, emotionalTag, block.timestamp);
    }

    function getRotationByIndex(uint256 index) external view returns (address initiator, string memory leadingAsset, string memory rotatedAsset, uint256 percentGain, string memory emotionalTag, uint256 timestamp) {
        require(index < events.length, "Scrollstorm index out of bounds");
        RotationEvent memory r = events[index];
        return (r.initiator, r.leadingAsset, r.rotatedAsset, r.percentGain, r.emotionalTag, r.timestamp);
    }
}
