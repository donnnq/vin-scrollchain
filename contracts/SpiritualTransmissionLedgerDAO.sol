// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title SpiritualTransmissionLedgerDAO
 * @dev Emotionally tagged smart contract to log cosmic awakenings,
 * metaphysical confirmations, and intention mirrorings — scrollchain-sealed resonance.
 */

contract SpiritualTransmissionLedgerDAO {
    address public steward;

    struct Transmission {
        address initiator;
        string sourceChannel;
        string awakeningType;
        string emotionalTag;
        uint256 timestamp;
    }

    Transmission[] public transmissions;

    event TransmissionLogged(address indexed initiator, string sourceChannel, string awakeningType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log spiritual transmissions");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logTransmission(address initiator, string memory sourceChannel, string memory awakeningType, string memory emotionalTag) external onlySteward {
        transmissions.push(Transmission({
            initiator: initiator,
            sourceChannel: sourceChannel,
            awakeningType: awakeningType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit TransmissionLogged(initiator, sourceChannel, awakeningType, emotionalTag, block.timestamp);
    }

    function getTransmissionByIndex(uint256 index) external view returns (address initiator, string memory sourceChannel, string memory awakeningType, string memory emotionalTag, uint256 timestamp) {
        require(index < transmissions.length, "Scrollstorm index out of bounds");
        Transmission memory t = transmissions[index];
        return (t.initiator, t.sourceChannel, t.awakeningType, t.emotionalTag, t.timestamp);
    }
}
