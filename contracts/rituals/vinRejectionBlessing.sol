// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinRejectionBlessing - Ritual contract for dignified rejection and opportunity redirection
/// @author Vinvin
/// @notice Rejects applicants with grace, offers referrals or alternative roles
/// @dev Integrates with vinHRBlessingForm.sol and civic job pools

contract vinRejectionBlessing {
    address public scrollsmith;

    struct Rejection {
        string applicantName;
        string reason;
        string referralOrg;
        string suggestedRole;
        bool humanAssistanceOffered;
        uint256 timestamp;
    }

    Rejection[] public rejections;

    event RejectionBlessed(string applicantName, string referralOrg, string suggestedRole);

    constructor() {
        scrollsmith = msg.sender;
    }

    function blessRejection(
        string memory applicantName,
        string memory reason,
        string memory referralOrg,
        string memory suggestedRole,
        bool humanAssistanceOffered
    ) public {
        rejections.push(Rejection(applicantName, reason, referralOrg, suggestedRole, humanAssistanceOffered, block.timestamp));
        emit RejectionBlessed(applicantName, referralOrg, suggestedRole);
    }

    function totalRejections() public view returns (uint256) {
        return rejections.length;
    }
}
