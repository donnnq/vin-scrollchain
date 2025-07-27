// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

/// @title vinEmpowermentCore
/// @notice Assess people’s origins and strengths, then let supporters propose and track personalized guidance.
contract vinEmpowermentCore is Ownable {
    struct Profile {
        string    origin;             // Where they come from or their core story
        string[]  strengths;          // Skills, talents, passions
        string[]  growthAreas;        // What they want to improve
        uint8     priorityLevel;      // 1–5, how urgently they seek support
        bool      exists;
        uint256   lastAssessed;       // Timestamp of last update
    }

    struct SupportPlan {
        address   supporter;          // Who offers the guidance
        string    description;        // Plan details (mentorship, resources, tasks)
        bool      accepted;           // Whether user has accepted
        uint256   timestamp;          
    }

    mapping(address => Profile) private _profiles;
    mapping(address => SupportPlan[]) private _supportPlans;

    event ProfileAssessed(
        address indexed user,
        string origin,
        uint8   priorityLevel,
        uint256 timestamp
    );
    event SupportProposed(
        address indexed user,
        uint256 planId,
        address indexed supporter,
        string description
    );
    event SupportAccepted(
        address indexed user,
        uint256 planId,
        address indexed supporter
    );

    /// @notice Create or update your personal assessment.
    function assessProfile(
        string calldata origin,
        string[] calldata strengths,
        string[] calldata growthAreas,
        uint8 priorityLevel
    ) external {
        require(priorityLevel >= 1 && priorityLevel <= 5, "Priority 1–5");
        Profile storage p = _profiles[msg.sender];
        p.origin         = origin;
        p.strengths      = strengths;
        p.growthAreas    = growthAreas;
        p.priorityLevel  = priorityLevel;
        p.exists         = true;
        p.lastAssessed   = block.timestamp;
        emit ProfileAssessed(msg.sender, origin, priorityLevel, block.timestamp);
    }

    /// @notice View someone’s assessment (public).
    function viewProfile(address user)
        external
        view
        returns (
            string memory origin,
            string[] memory strengths,
            string[] memory growthAreas,
            uint8    priorityLevel,
            uint256  lastAssessed
        )
    {
        Profile storage p = _profiles[user];
        require(p.exists, "No profile");
        return (
            p.origin,
            p.strengths,
            p.growthAreas,
            p.priorityLevel,
            p.lastAssessed
        );
    }

    /// @notice Propose a guidance or support plan for a user.
    function proposeSupport(address user, string calldata description) external {
        require(_profiles[user].exists, "User not assessed");
        uint256 planId = _supportPlans[user].length;
        _supportPlans[user].push(
            SupportPlan({
                supporter:   msg.sender,
                description: description,
                accepted:    false,
                timestamp:   block.timestamp
            })
        );
        emit SupportProposed(user, planId, msg.sender, description);
    }

    /// @notice User accepts a proposed support plan.
    function acceptSupport(uint256 planId) external {
        require(planId < _supportPlans[msg.sender].length, "Invalid plan");
        SupportPlan storage sp = _supportPlans[msg.sender][planId];
        require(!sp.accepted, "Already accepted");
        sp.accepted = true;
        emit SupportAccepted(msg.sender, planId, sp.supporter);
    }

    /// @notice Retrieve all support plans for a user.
    function getSupportPlans(address user)
        external
        view
        returns (SupportPlan[] memory)
    {
        return _supportPlans[user];
    }
}
