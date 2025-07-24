// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinAppealNarrative.sol
/// @author VINVIN
/// @notice Attaches soulbound stories to jurisdiction reclass requests — validating appeals via cultural and symbolic significance

contract vinAppealNarrative {
    address public scrollkeeper;

    struct Narrative {
        string originStory;
        string culturalLink;
        string dignityReason;
        bool approved;
    }

    mapping(address => Narrative) public appeals;
    event NarrativeSubmitted(address claimant, string originStory);
    event AppealApproved(address claimant, string dignityReason);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Access denied");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    /// @notice Submit mythstream-backed appeal narrative
    function submitNarrative(
        address claimant,
        string memory originStory,
        string memory culturalLink,
        string memory dignityReason
    ) external onlyScrollkeeper {
        appeals[claimant] = Narrative(originStory, culturalLink, dignityReason, false);
        emit NarrativeSubmitted(claimant, originStory);
    }

    /// @notice Validate and approve appeal if scrollkeeper deems worthy
    function approveAppeal(address claimant) external onlyScrollkeeper {
        require(bytes(appeals[claimant].originStory).length > 0, "No narrative found");
        appeals[claimant].approved = true;
        emit AppealApproved(claimant, appeals[claimant].dignityReason);
    }

    /// @notice View appeal status
    function isApproved(address claimant) external view returns (bool) {
        return appeals[claimant].approved;
    }
}
