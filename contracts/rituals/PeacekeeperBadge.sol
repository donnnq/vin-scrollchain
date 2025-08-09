// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title PeacekeeperBadge - Ritual scroll for dignified civic service
/// @author Vinvin
/// @notice Grants soulbound badges to ICE agents who pass grace audits
/// @dev Emits ritual events for welcome and service acknowledgment

contract PeacekeeperBadge {
    mapping(address => bool) public hasBadge;
    mapping(address => string) public lastGreeting;
    mapping(address => string) public lastServiceLevel;

    event WelcomeEmitted(address indexed agent, string message);
    event ServiceAcknowledged(address indexed traveler, string serviceLevel);
    event BadgeAssigned(address indexed agent);
    event BadgeRevoked(address indexed agent);

    modifier onlyBadgeHolder() {
        require(hasBadge[msg.sender], "PeacekeeperBadge: Badge required");
        _;
    }

    /// @notice Assigns badge to agent after passing grace audit
    function assignBadge(address agent) external {
        require(passedGraceAudit(agent), "PeacekeeperBadge: Agent not eligible");
        hasBadge[agent] = true;
        emit BadgeAssigned(agent);
        emit WelcomeEmitted(agent, "Welcome traveler. You are safe and honored.");
        lastGreeting[agent] = "Welcome traveler. You are safe and honored.";
    }

    /// @notice Revokes badge if behavior slips
    function revokeBadge(address agent) external {
        hasBadge[agent] = false;
        emit BadgeRevoked(agent);
    }

    /// @notice Acknowledges service level for a traveler
    function acknowledgeService(address traveler, string calldata serviceLevel) external onlyBadgeHolder {
        emit ServiceAcknowledged(traveler, serviceLevel);
        lastServiceLevel[traveler] = serviceLevel;
    }

    /// @dev Placeholder for actual audit logic (connect to ICEAudit or SentimentOracle)
    function passedGraceAudit(address agent) internal view returns (bool) {
        // TODO: Integrate with ICEAudit.sol or SentimentOracle.sol
        return true;
    }

    /// @notice View last greeting emitted by agent
    function getLastGreeting(address agent) external view returns (string memory) {
        return lastGreeting[agent];
    }

    /// @notice View last service level acknowledged for traveler
    function getLastServiceLevel(address traveler) external view returns (string memory) {
        return lastServiceLevel[traveler];
    }
}
