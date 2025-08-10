// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title SovereignSupport - Ritual contract for financial aid to struggling nations
/// @author Vinvin
/// @notice Encodes unconditional support for production, business revival, and expansion

contract SovereignSupport {
    address public scrollsmith;

    struct SupportedNation {
        string country;
        string contactPerson;
        bool isActive;
        uint256 totalSupportGiven;
        string struggleNarrative; // e.g. "Post-conflict recovery", "Climate-hit agriculture", "Debt crisis"
        uint256 timestamp;
    }

    mapping(string => SupportedNation) public nations;
    string[] public supportedList;

    event SupportGranted(string country, uint256 amount, string narrative);
    event NationActivated(string country, string contactPerson);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Activate a nation for support
    function activateNation(
        string calldata country,
        string calldata contactPerson,
        string calldata struggleNarrative
    ) external onlyScrollsmith {
        require(!nations[country].isActive, "Already activated");

        nations[country] = SupportedNation(
            country,
            contactPerson,
            true,
            0,
            struggleNarrative,
            block.timestamp
        );

        supportedList.push(country);
        emit NationActivated(country, contactPerson);
    }

    /// @notice Grant financial support to a nation
    function grantSupport(string calldata country, uint256 amount) external onlyScrollsmith {
        SupportedNation storage nation = nations[country];
        require(nation.isActive, "Nation not activated");

        nation.totalSupportGiven += amount;
        emit SupportGranted(country, amount, nation.struggleNarrative);
    }

    /// @notice View supported nations
    function getSupportedList() external view returns (string[] memory) {
        return supportedList;
    }

    /// @notice View details of a supported nation
    function getNation(string calldata country) external view returns (SupportedNation memory) {
        return nations[country];
    }
}
