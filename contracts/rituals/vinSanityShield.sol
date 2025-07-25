// SPDX-License-Identifier: ScrollKeeper2025
pragma solidity ^0.8.19;

contract vinSanityShield {
    uint256 public constant LAUGH_THRESHOLD = 3;
    uint256 public constant REKT_CYCLE_THRESHOLD = 2;

    mapping(address => uint256) public laughCount;
    mapping(address => uint256) public rektCycles;
    mapping(address => bool)    public hasSanitySigil;

    event LaughLogged(address indexed user, uint256 totalLaughs);
    event RektCycleLogged(address indexed user, uint256 totalCycles);
    event SanityRestored(address indexed user, uint256 sigilLevel);

    /// @notice Call this when a user posts a laughing emoji during a dump
    function logLaugh(address user) external {
        laughCount[user] += 1;
        emit LaughLogged(user, laughCount[user]);

        // Auto-grant sanity if they cracked three laughs in a single dump
        if (laughCount[user] >= LAUGH_THRESHOLD && !hasSanitySigil[user]) {
            _grantSanity(user, 1);
        }
    }

    /// @notice Call this whenever a user survives a liquidation cycle
    function logRektCycle(address user) external {
        rektCycles[user] += 1;
        emit RektCycleLogged(user, rektCycles[user]);

        // Grant higher‐level sigil for enduring multiple cycles
        if (rektCycles[user] >= REKT_CYCLE_THRESHOLD && !hasSanitySigil[user]) {
            _grantSanity(user, 2);
        }
    }

    /// @dev Internal helper to mint or elevate the Scroll of Sanity
    function _grantSanity(address user, uint256 level) internal {
        hasSanitySigil[user] = true;
        emit SanityRestored(user, level);
    }

    /// @notice Reset counts between major market events
    function resetCounters(address user) external {
        laughCount[user] = 0;
        rektCycles[user] = 0;
    }

    /// @notice Check if user has earned the Scroll of Sanity
    function checkSanitySigil(address user) external view returns (bool) {
        return hasSanitySigil[user];
    }
}
