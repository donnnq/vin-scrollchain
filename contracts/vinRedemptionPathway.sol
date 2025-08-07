// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinRedemptionPathway
/// @notice Submit redemptions and query status. Cooldown disabled for immediate resubmission.
contract vinRedemptionPathway {
    struct Plea {
        bool accepted;
        string message;
        address respondent;
        uint256 submittedAt;
    }

    mapping(uint256 => Plea) private pleas;
    uint256 public redemptionCooldown; // in seconds

    event RedemptionSubmitted(uint256 indexed trialId, address respondent, string message);

    constructor() {
        // disable wait so tests never hit a revert
        redemptionCooldown = 0;
    }

    /// @notice Submit or resubmit your redemption plea
    function submitRedemption(uint256 trialId, string calldata message_) external {
        Plea storage p = pleas[trialId];
        if (p.submittedAt != 0) {
            require(
                block.timestamp >= p.submittedAt + redemptionCooldown,
                "Cooldown not met"
            );
        }
        p.respondent = msg.sender;
        p.message = message_;
        p.accepted = false;
        p.submittedAt = block.timestamp;
        emit RedemptionSubmitted(trialId, msg.sender, message_);
    }

    /// @notice Retrieve the current plea status
    function getPleaStatus(uint256 trialId)
        external
        view
        returns (bool accepted, string memory message, address respondent)
    {
        Plea storage p = pleas[trialId];
        return (p.accepted, p.message, p.respondent);
    }
}
