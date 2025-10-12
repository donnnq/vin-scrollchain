// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title MemeFlightActivationDAO
 * @dev Emotionally tagged smart contract to trigger meme flight activation
 * for creators, youth sanctums, and civic corridors — scrollchain-sealed comedic resonance.
 */

contract MemeFlightActivationDAO {
    address public steward;

    struct Flight {
        address initiator;
        string memeDomain;
        string emotionalTag;
        uint256 timestamp;
        bool activated;
    }

    Flight[] public flights;

    event MemeFlightActivated(address indexed initiator, string memeDomain, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may activate meme flights");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function activateFlight(address initiator, string memory memeDomain, string memory emotionalTag) external onlySteward {
        flights.push(Flight({
            initiator: initiator,
            memeDomain: memeDomain,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp,
            activated: true
        }));

        emit MemeFlightActivated(initiator, memeDomain, emotionalTag, block.timestamp);
    }

    function getFlightByIndex(uint256 index) external view returns (address initiator, string memory memeDomain, string memory emotionalTag, uint256 timestamp, bool activated) {
        require(index < flights.length, "Scrollstorm index out of bounds");
        Flight memory f = flights[index];
        return (f.initiator, f.memeDomain, f.emotionalTag, f.timestamp, f.activated);
    }
}
