// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinSenatorBadgeRelay
/// @notice A simple registry for assigning, revoking, and querying “senator” badges
contract vinSenatorBadgeRelay {
    address public badgeClerk;
    mapping(address => string) private badgeBook;

    event BadgeAssigned(address indexed user, string badge);
    event BadgeRevoked(address indexed user, string badge);
    event ClerkChanged(address indexed oldClerk, address indexed newClerk);

    modifier onlyClerk() {
        require(msg.sender == badgeClerk, "Only badge clerk may call this");
        _;
    }

    /// @notice Sets the deployer as badge clerk
    constructor() {
        badgeClerk = msg.sender;
    }

    /// @notice Assigns a badge string to a user
    /// @param user Account receiving the badge
    /// @param badge Text label of the badge
    function assignBadge(address user, string calldata badge) external onlyClerk {
        badgeBook[user] = badge;
        emit BadgeAssigned(user, badge);
    }

    /// @notice Revokes any badge assigned to a user
    /// @param user Account whose badge is to be revoked
    function revokeBadge(address user) external onlyClerk {
        string memory oldBadge = badgeBook[user];
        require(bytes(oldBadge).length != 0, "No badge to revoke");
        delete badgeBook[user];
        emit BadgeRevoked(user, oldBadge);
    }

    /// @notice Returns the badge string for a given user (empty if none)
    /// @param user Account to query
    /// @return badge Label currently assigned
    function getBadge(address user) external view returns (string memory badge) {
        return badgeBook[user];
    }

    /// @notice Transfers the clerk role to a new address
    /// @param newClerk Address to become the new badge clerk
    function changeClerk(address newClerk) external onlyClerk {
        require(newClerk != address(0), "Clerk cannot be zero address");
        address old = badgeClerk;
        badgeClerk = newClerk;
        emit ClerkChanged(old, newClerk);
    }
}
