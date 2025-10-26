// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TruthReminderToPublicProtocol {
    address public steward;

    struct ReminderEntry {
        string message; // "Main source muna bago magalit. Huwag haka-haka."
        string emotionalTag;
        bool broadcasted;
        bool sealed;
    }

    ReminderEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastReminder(string memory message, string memory emotionalTag) external onlySteward {
        entries.push(ReminderEntry(message, emotionalTag, true, false));
    }

    function sealReminderEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getReminderEntry(uint256 index) external view returns (ReminderEntry memory) {
        return entries[index];
    }
}
