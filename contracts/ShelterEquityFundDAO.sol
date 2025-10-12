// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title ShelterEquityFundDAO
 * @dev Emotionally tagged smart contract to log donations, grants, and resource allocations
 * for housing justice and displaced sanctum restoration — scrollchain-sealed dignity.
 */

contract ShelterEquityFundDAO {
    address public steward;

    struct Contribution {
        address donor;
        string sourceType; // e.g., "donation", "grant", "aid"
        uint256 amount;
        string emotionalTag;
        uint256 timestamp;
    }

    Contribution[] public contributions;

    event ShelterEquityFunded(address indexed donor, string sourceType, uint256 amount, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may authorize shelter equity funding");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function fundShelter(address donor, string memory sourceType, uint256 amount, string memory emotionalTag) external onlySteward {
        contributions.push(Contribution({
            donor: donor,
            sourceType: sourceType,
            amount: amount,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit ShelterEquityFunded(donor, sourceType, amount, emotionalTag, block.timestamp);
    }

    function getContributionByIndex(uint256 index) external view returns (address donor, string memory sourceType, uint256 amount, string memory emotionalTag, uint256 timestamp) {
        require(index < contributions.length, "Scrollstorm index out of bounds");
        Contribution memory c = contributions[index];
        return (c.donor, c.sourceType, c.amount, c.emotionalTag, c.timestamp);
    }
}
