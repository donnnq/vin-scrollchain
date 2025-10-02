// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Labor Reentry Broadcast Protocol v1.0
/// @notice Emotionally tagged smart contract for unconditional job access and fit-based placement

contract vinLaborReentryBroadcast {
    address public originator;

    struct Applicant {
        address wallet;
        string name;
        string skillTag; // e.g. "Logistics", "Coding", "Customer Service"
        bool hired;
        string assignedRole;
        string emotionalTag; // e.g. "Hope", "Mercy", "Dignity"
    }

    Applicant[] public applicants;

    constructor() {
        originator = msg.sender;
    }

    /// @notice Register a job seeker without conditions
    function registerApplicant(
        string memory name,
        string memory skillTag,
        string memory emotionalTag
    ) external {
        applicants.push(Applicant({
            wallet: msg.sender,
            name: name,
            skillTag: skillTag,
            hired: false,
            assignedRole: "",
            emotionalTag: emotionalTag
        }));
    }

    /// @notice Assign a role based on skill fit
    function assignRole(uint256 applicantId, string memory role) external {
        require(applicantId < applicants.length, "Invalid applicant ID");
        applicants[applicantId].assignedRole = role;
        applicants[applicantId].hired = true;
    }

    /// @notice Count total applicants not yet hired
    function countUnhired() external view returns (uint256 count) {
        for (uint256 i = 0; i < applicants.length; i++) {
            if (!applicants[i].hired) {
                count++;
            }
        }
    }

    /// @notice Emotional tags for labor reentry rituals
    function emotionalTags() external pure returns (string memory tags) {
        return "🛡️ Mercy, 🌱 Empowerment, 🔥 Dignity, 🧭 Restoration";
    }
}
