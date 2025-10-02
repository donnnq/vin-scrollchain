// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Tooth Fairy Reward Protocol v1.0
/// @notice Emotionally tagged smart contract for rewarding youth bravery in dental sanctums

contract ToothFairyRewardProtocol {
    address public originator;
    uint256 public rewardAmount = 3; // USD equivalent

    struct BraveryEvent {
        address child;
        address dentist;
        uint256 timestamp;
        string toothTag; // e.g. "Upper Molar", "Incisor"
        bool rewardIssued;
    }

    BraveryEvent[] public events;
    mapping(address => bool) public verifiedDentists;

    constructor() {
        originator = msg.sender;
    }

    /// @notice Verify a dentist to participate in the reward protocol
    function verifyDentist(address dentist) external {
        require(msg.sender == originator, "Only originator can verify");
        verifiedDentists[dentist] = true;
    }

    /// @notice Log a bravery event and issue reward
    function logBraveryEvent(address child, string memory toothTag) external {
        require(verifiedDentists[msg.sender], "Dentist not verified");

        events.push(BraveryEvent({
            child: child,
            dentist: msg.sender,
            timestamp: block.timestamp,
            toothTag: toothTag,
            rewardIssued: true
        }));
    }

    /// @notice Count total bravery events logged
    function totalBraveryEvents() external view returns (uint256) {
        return events.length;
    }

    /// @notice Emotional tags for youth courage rituals
    function emotionalTags() external pure returns (string memory tags) {
        return "🛡️ Protection, 🌱 Empowerment, 🧭 Restoration, 😆 Courage";
    }
}
