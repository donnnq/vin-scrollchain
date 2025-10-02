// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Labor Access Protocol v1.0
/// @notice Emotionally tagged smart contract for red tape-free job access and corridor dignity enforcement

contract LaborAccessProtocol {
    struct Applicant {
        address wallet;
        string skillTag;
        bool hasID;
        bool isCommunityVerified;
        bool isYouth;
    }

    Applicant[] public applicants;

    /// @notice Register a job applicant with simplified access
    function registerApplicant(
        string memory skillTag,
        bool hasID,
        bool communityVerified,
        bool youth
    ) external {
        applicants.push(Applicant({
            wallet: msg.sender,
            skillTag: skillTag,
            hasID: hasID,
            isCommunityVerified: communityVerified,
            isYouth: youth
        }));
    }

    /// @notice Count applicants without formal ID but verified by community
    function countNoIDVerified() external view returns (uint256 count) {
        for (uint256 i = 0; i < applicants.length; i++) {
            if (!applicants[i].hasID && applicants[i].isCommunityVerified) {
                count++;
            }
        }
    }

    /// @notice Count youth applicants
    function countYouthApplicants() external view returns (uint256 count) {
        for (uint256 i = 0; i < applicants.length; i++) {
            if (applicants[i].isYouth) {
                count++;
            }
        }
    }

    /// @notice Emotional tags for labor dignity
    function emotionalTags() external pure returns (string memory tags) {
        return "🛡️ Protection, 🌱 Empowerment, 🔥 Deterrence";
    }
}
