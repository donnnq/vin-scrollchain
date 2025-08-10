// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title ImmigrantRightsProtector - Ensures free, legal, and humane processing for immigration and work eligibility
/// @author Vinvin
/// @notice Encodes peaceful pathways, protection, and assistance rituals for immigrant rights

contract ImmigrantRightsProtector {
    address public scrollsmith;

    enum Phase { Unassisted, Supported, Legalized, Honored }

    struct RightClaim {
        address immigrant;
        string name;
        string originCountry;
        string intent; // e.g. "Work", "Family", "Education"
        Phase phase;
        bool isPeaceful;
        string apology; // If system failed them before
        bool freeProcessing;
        uint256 timestamp;
    }

    mapping(address => RightClaim) public claims;
    address[] public protectedList;

    event SupportGranted(address indexed immigrant);
    event Legalized(address indexed immigrant);
    event Honored(address indexed immigrant, string apology);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Immigrant requests peaceful and legal support
    function requestSupport(
        string calldata name,
        string calldata originCountry,
        string calldata intent,
        bool isPeaceful
    ) external {
        require(claims[msg.sender].phase == Phase.Unassisted, "Already in system");

        claims[msg.sender] = RightClaim(
            msg.sender,
            name,
            originCountry,
            intent,
            Phase.Supported,
            isPeaceful,
            "",
            true,
            block.timestamp
        );

        protectedList.push(msg.sender);
        emit SupportGranted(msg.sender);
    }

    /// @notice Legalize immigrant's claim and confirm protection
    function legalizeClaim(address immigrant) external onlyScrollsmith {
        require(claims[immigrant].phase == Phase.Supported, "Not eligible for legalization");

        claims[immigrant].phase = Phase.Legalized;
        emit Legalized(immigrant);
    }

    /// @notice Honor immigrant and offer apology if previously denied dignity
    function honorClaim(address immigrant, string calldata apologyMessage) external onlyScrollsmith {
        require(claims[immigrant].phase == Phase.Legalized, "Must be legalized first");

        claims[immigrant].phase = Phase.Honored;
        claims[immigrant].apology = apologyMessage;
        emit Honored(immigrant, apologyMessage);
    }

    /// @notice View all protected immigrant claims
    function getProtectedList() external view returns (address[] memory) {
        return protectedList;
    }

    /// @notice View claim details
    function getClaim(address immigrant) external view returns (RightClaim memory) {
        return claims[immigrant];
    }
}
