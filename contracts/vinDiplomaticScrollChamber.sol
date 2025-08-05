// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Diplomatic Scroll Chamber
/// @notice Orchestrates entry rituals and archival of inter-sovereign pacts

contract vinDiplomaticScrollChamber {
    address public ritualKeeper;
    string[] public diplomaticEntries;

    event ScrollEntered(string country, string scrollID, string commitment);
    event KeeperChanged(address newKeeper);

    constructor() {
        ritualKeeper = msg.sender;
    }

    modifier onlyKeeper() {
        require(msg.sender == ritualKeeper, "Unauthorized keeper.");
        _;
    }

    function enterScroll(string memory country, string memory scrollID, string memory commitment) external onlyKeeper {
        string memory entry = string(abi.encodePacked(country, " :: ", scrollID, " :: ", commitment));
        diplomaticEntries.push(entry);
        emit ScrollEntered(country, scrollID, commitment);
    }

    function listEntries() external view returns (string[] memory) {
        return diplomaticEntries;
    }

    function updateKeeper(address newKeeper) external onlyKeeper {
        ritualKeeper = newKeeper;
        emit KeeperChanged(newKeeper);
    }
}
