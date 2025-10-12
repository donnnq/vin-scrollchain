// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title DiasporaNourishmentProtocolDAO
 * @dev Emotionally tagged smart contract to trigger nourishment deployments
 * for displaced communities, ancestral kitchens, and cultural sanctums — scrollchain-sealed mercy.
 */

contract DiasporaNourishmentProtocolDAO {
    address public steward;

    struct Nourishment {
        address initiator;
        string region;
        string foodType;
        string emotionalTag;
        uint256 timestamp;
        bool activated;
    }

    Nourishment[] public nourishments;

    event NourishmentActivated(address indexed initiator, string region, string foodType, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may activate nourishment protocols");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function activateNourishment(address initiator, string memory region, string memory foodType, string memory emotionalTag) external onlySteward {
        nourishments.push(Nourishment({
            initiator: initiator,
            region: region,
            foodType: foodType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp,
            activated: true
        }));

        emit NourishmentActivated(initiator, region, foodType, emotionalTag, block.timestamp);
    }

    function getNourishmentByIndex(uint256 index) external view returns (address initiator, string memory region, string memory foodType, string memory emotionalTag, uint256 timestamp, bool activated) {
        require(index < nourishments.length, "Scrollstorm index out of bounds");
        Nourishment memory n = nourishments[index];
        return (n.initiator, n.region, n.foodType, n.emotionalTag, n.timestamp, n.activated);
    }
}
