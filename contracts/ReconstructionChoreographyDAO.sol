// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title ReconstructionChoreographyDAO
 * @dev Emotionally tagged smart contract to log rebuilding rituals,
 * infrastructure restoration, and civic rebirth — scrollchain-sealed consequence.
 */

contract ReconstructionChoreographyDAO {
    address public steward;

    struct RebuildEvent {
        address initiator;
        string region;
        string projectType; // "Housing", "Schools", "Hospitals", "Roads"
        string fundingSource; // "UN", "USAID", "Local Government"
        string emotionalTag;
        uint256 timestamp;
    }

    RebuildEvent[] public events;

    event RebuildLogged(address indexed initiator, string region, string projectType, string fundingSource, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log reconstruction choreography rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logRebuild(address initiator, string memory region, string memory projectType, string memory fundingSource, string memory emotionalTag) external onlySteward {
        events.push(RebuildEvent({
            initiator: initiator,
            region: region,
            projectType: projectType,
            fundingSource: fundingSource,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit RebuildLogged(initiator, region, projectType, fundingSource, emotionalTag, block.timestamp);
    }

    function getRebuildByIndex(uint256 index) external view returns (address initiator, string memory region, string memory projectType, string memory fundingSource, string memory emotionalTag, uint256 timestamp) {
        require(index < events.length, "Scrollstorm index out of bounds");
        RebuildEvent memory r = events[index];
        return (r.initiator, r.region, r.projectType, r.fundingSource, r.emotionalTag, r.timestamp);
    }
}
