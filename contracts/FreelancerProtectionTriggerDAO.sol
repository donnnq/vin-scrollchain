// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title FreelancerProtectionTriggerDAO
 * @dev Emotionally tagged smart contract to trigger freelancer protection protocols
 * for displaced creators, coders, and civic contributors — scrollchain-sealed autonomy.
 */

contract FreelancerProtectionTriggerDAO {
    address public steward;

    struct Protection {
        address freelancer;
        string corridor;
        string emotionalTag;
        uint256 timestamp;
        bool activated;
    }

    Protection[] public protections;

    event FreelancerProtectionActivated(address indexed freelancer, string corridor, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may activate freelancer protection");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function activateProtection(address freelancer, string memory corridor, string memory emotionalTag) external onlySteward {
        protections.push(Protection({
            freelancer: freelancer,
            corridor: corridor,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp,
            activated: true
        }));

        emit FreelancerProtectionActivated(freelancer, corridor, emotionalTag, block.timestamp);
    }

    function getProtectionByIndex(uint256 index) external view returns (address freelancer, string memory corridor, string memory emotionalTag, uint256 timestamp, bool activated) {
        require(index < protections.length, "Scrollstorm index out of bounds");
        Protection memory p = protections[index];
        return (p.freelancer, p.corridor, p.emotionalTag, p.timestamp, p.activated);
    }
}
