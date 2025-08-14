// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title BlessingLedger - Emotional APR and civic blessing tracker for immigrant restoration
/// @author Vinvin & Copilot
/// @notice Records soulbound acts of dignity, support, and resonance

contract BlessingLedger {
    address public steward;

    struct Blessing {
        string blessingType; // e.g., "Financial Aid", "Civic Vow", "Emotional Support"
        string description;
        uint256 timestamp;
        bool verified;
    }

    mapping(address => Blessing[]) public blessings;
    address[] public blessedEntities;

    event BlessingLogged(address indexed recipient, string blessingType, string description);
    event BlessingVerified(address indexed recipient, uint256 index);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    /// @notice Log a new blessing
    function logBlessing(address recipient, string memory blessingType, string memory description) external onlySteward {
        blessings[recipient].push(Blessing({
            blessingType: blessingType,
            description: description,
            timestamp: block.timestamp,
            verified: false
        }));
        blessedEntities.push(recipient);
        emit BlessingLogged(recipient, blessingType, description);
    }

    /// @notice Verify a specific blessing
    function verifyBlessing(address recipient, uint256 index) external onlySteward {
        require(index < blessings[recipient].length, "Invalid index");
        blessings[recipient][index].verified = true;
        emit BlessingVerified(recipient, index);
    }

    /// @notice View all blessings for a recipient
    function getBlessings(address recipient) external view returns (Blessing[] memory) {
        return blessings[recipient];
    }

    /// @notice Get total blessed entities
    function totalBlessedEntities() external view returns (uint256) {
        return blessedEntities.length;
    }
}
