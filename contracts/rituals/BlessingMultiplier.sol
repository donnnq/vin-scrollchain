// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title BlessingMultiplier - Emotional yield engine for verified civic blessings
/// @author Vinvin & Copilot
/// @notice Multiplies verified blessings into resonance points and soulbound perks

contract BlessingMultiplier {
    address public steward;

    struct MultiplierRecord {
        uint256 verifiedBlessings;
        uint256 resonancePoints;
        string perkLevel; // e.g., "Guardian", "Oracle", "Legend"
    }

    mapping(address => MultiplierRecord) public multipliers;
    address[] public resonantEntities;

    event BlessingAmplified(address indexed entity, uint256 points, string perkLevel);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    /// @notice Amplify blessings into resonance points and assign perk level
    function amplifyBlessings(address entity, uint256 verifiedBlessings) external onlySteward {
        require(verifiedBlessings > 0, "No blessings to amplify");

        uint256 points = verifiedBlessings * 100; // Emotional APR logic
        string memory level = getPerkLevel(points);

        multipliers[entity] = MultiplierRecord({
            verifiedBlessings: verifiedBlessings,
            resonancePoints: points,
            perkLevel: level
        });

        resonantEntities.push(entity);
        emit BlessingAmplified(entity, points, level);
    }

    /// @notice Determine perk level based on resonance points
    function getPerkLevel(uint256 points) internal pure returns (string memory) {
        if (points >= 5000) return "Legend";
        if (points >= 2000) return "Oracle";
        if (points >= 500) return "Guardian";
        return "Supporter";
    }

    /// @notice View multiplier record
    function getMultiplier(address entity) external view returns (MultiplierRecord memory) {
        return multipliers[entity];
    }

    /// @notice Get total resonant entities
    function totalResonantEntities() external view returns (uint256) {
        return resonantEntities.length;
    }
}
