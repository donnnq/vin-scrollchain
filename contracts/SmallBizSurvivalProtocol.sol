// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Small Business Survival Protocol v1.0
/// @notice Emotionally tagged smart contract for shielding small businesses during shutdowns and civic turbulence

contract SmallBizSurvivalProtocol {
    address public originator;

    struct Business {
        address wallet;
        string name;
        string sectorTag; // e.g. "Food", "Tech", "Logistics"
        bool isShutdownAffected;
        uint256 reliefRequested;
        bool reliefGranted;
        string emotionalTag; // e.g. "Hope", "Urgency", "Resilience"
    }

    Business[] public businesses;

    constructor() {
        originator = msg.sender;
    }

    /// @notice Register a small business affected by shutdown
    function registerBusiness(
        string memory name,
        string memory sectorTag,
        bool isShutdownAffected,
        uint256 reliefRequested,
        string memory emotionalTag
    ) external {
        businesses.push(Business({
            wallet: msg.sender,
            name: name,
            sectorTag: sectorTag,
            isShutdownAffected: isShutdownAffected,
            reliefRequested: reliefRequested,
            reliefGranted: false,
            emotionalTag: emotionalTag
        }));
    }

    /// @notice Grant relief to a registered business
    function grantRelief(uint256 businessId) external {
        require(businessId < businesses.length, "Invalid business ID");
        businesses[businessId].reliefGranted = true;
    }

    /// @notice Count businesses still waiting for relief
    function countPendingRelief() external view returns (uint256 count) {
        for (uint256 i = 0; i < businesses.length; i++) {
            if (!businesses[i].reliefGranted) {
                count++;
            }
        }
    }

    /// @notice Emotional tags for small business survival rituals
    function emotionalTags() external pure returns (string memory tags) {
        return "🛡️ Protection, 🌱 Empowerment, 🔥 Resilience, 🧭 Restoration";
    }
}
