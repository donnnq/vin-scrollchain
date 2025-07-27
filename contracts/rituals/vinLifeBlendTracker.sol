// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title vinLifeBlendTracker
/// @notice Log personal emotional blends throughout your journey.
contract vinLifeBlendTracker {
    enum LifeTimpla {
        BITTER,
        SWEET,
        BALANCED,
        STIRRED,
        BREWING
    }

    struct BrewLog {
        LifeTimpla state;
        string     note;       // Optional reflection or metaphor
        uint256    timestamp;
    }

    // user → their sequence of brew entries
    mapping(address => BrewLog[]) private _journal;

    event BrewLogged(
        address indexed user,
        LifeTimpla        state,
        string            note,
        uint256           timestamp
    );

    /// @notice Log today’s emotional blend with an optional reflection.
    function logBrew(LifeTimpla state, string calldata note) external {
        _journal[msg.sender].push(
            BrewLog({ state: state, note: note, timestamp: block.timestamp })
        );
        emit BrewLogged(msg.sender, state, note, block.timestamp);
    }

    /// @notice Retrieve a log entry by index.
    function viewLog(address user, uint256 index)
        external
        view
        returns (
            LifeTimpla state,
            string memory note,
            uint256 timestamp
        )
    {
        require(index < _journal[user].length, "Index OOB");
        BrewLog storage entry = _journal[user][index];
        return (entry.state, entry.note, entry.timestamp);
    }

    /// @notice Get the total number of brew entries for a user.
    function countLogs(address user) external view returns (uint256) {
        return _journal[user].length;
    }

    /// @notice Optionally clear all your logs (reset the blend tracker).
    function resetJournal() external {
        delete _journal[msg.sender];
    }
}
