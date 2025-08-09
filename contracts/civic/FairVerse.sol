// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title FairVerse - Ritual scroll for fair use, open internet, and anti-censorship governance
/// @author Vinvin
/// @notice Protects remix culture, disables hypersensitive takedowns, and ensures free access to digital knowledge

contract FairVerse {
    address public scrollsmith;

    struct UseCase {
        address user;
        string contentUsed;
        string purpose;
        bool isTransformative;
        bool flagged;
        uint256 timestamp;
    }

    UseCase[] public uses;
    mapping(address => bool) public flaggedUsers;

    event UseLogged(address indexed user, string contentUsed, string purpose);
    event UserFlagged(address indexed user, string reason);
    event FlagRemoved(address indexed user);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Log a fair use case
    function logUse(string calldata contentUsed, string calldata purpose, bool isTransformative) external {
        uses.push(UseCase(msg.sender, contentUsed, purpose, isTransformative, false, block.timestamp));
        emit UseLogged(msg.sender, contentUsed, purpose);
    }

    /// @notice Flag a user only for actual harm (not remix or parody)
    function flagUser(address user, string calldata reason) external onlyScrollsmith {
        flaggedUsers[user] = true;
        emit UserFlagged(user, reason);
    }

    /// @notice Remove a flag if no harm was done
    function removeFlag(address user) external onlyScrollsmith {
        flaggedUsers[user] = false;
        emit FlagRemoved(user);
    }

    /// @notice View all fair use cases
    function getAllUses() external view returns (UseCase[] memory) {
        return uses;
    }

    /// @notice Check if a user is flagged
    function isFlagged(address user) external view returns (bool) {
        return flaggedUsers[user];
    }
}
