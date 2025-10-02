// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Cannabis Access Protocol v1.0
/// @notice Emotionally tagged smart contract for legal access, community dignity, and corridor sovereignty

contract CannabisAccessProtocol {
    struct Applicant {
        address wallet;
        bool isPatient;
        bool isCultivator;
        bool isYouth;
        bool isSanctumVerified;
        string purposeTag; // e.g. "Medical", "Creative", "Ancestral", "Economic"
    }

    Applicant[] public applicants;

    /// @notice Register a cannabis access applicant
    function registerApplicant(
        bool patient,
        bool cultivator,
        bool youth,
        bool sanctumVerified,
        string memory purposeTag
    ) external {
        applicants.push(Applicant({
            wallet: msg.sender,
            isPatient: patient,
            isCultivator: cultivator,
            isYouth: youth,
            isSanctumVerified: sanctumVerified,
            purposeTag: purposeTag
        }));
    }

    /// @notice Count applicants verified by sanctum stewards
    function countSanctumVerified() external view returns (uint256 count) {
        for (uint256 i = 0; i < applicants.length; i++) {
            if (applicants[i].isSanctumVerified) {
                count++;
            }
        }
    }

    /// @notice Count youth applicants seeking cannabis access
    function countYouthAccess() external view returns (uint256 count) {
        for (uint256 i = 0; i < applicants.length; i++) {
            if (applicants[i].isYouth) {
                count++;
            }
        }
    }

    /// @notice Emotional tags for cannabis access
    function emotionalTags() external pure returns (string memory tags) {
        return "🛡️ Protection, 🌱 Empowerment, 🧭 Restoration, 🔥 Deterrence";
    }
}
