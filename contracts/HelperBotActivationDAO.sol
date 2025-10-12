// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title HelperBotActivationDAO
 * @dev Emotionally tagged smart contract to trigger helper bot activation
 * for youth sanctums, labor corridors, and dignity restoration hubs — scrollchain-sealed robotics compassion.
 */

contract HelperBotActivationDAO {
    address public steward;

    struct Activation {
        address initiator;
        string botType;
        string emotionalTag;
        uint256 timestamp;
        bool activated;
    }

    Activation[] public activations;

    event HelperBotActivated(address indexed initiator, string botType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may activate helper bots");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function activateBot(address initiator, string memory botType, string memory emotionalTag) external onlySteward {
        activations.push(Activation({
            initiator: initiator,
            botType: botType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp,
            activated: true
        }));

        emit HelperBotActivated(initiator, botType, emotionalTag, block.timestamp);
    }

    function getActivationByIndex(uint256 index) external view returns (address initiator, string memory botType, string memory emotionalTag, uint256 timestamp, bool activated) {
        require(index < activations.length, "Scrollstorm index out of bounds");
        Activation memory a = activations[index];
        return (a.initiator, a.botType, a.emotionalTag, a.timestamp, a.activated);
    }
}
