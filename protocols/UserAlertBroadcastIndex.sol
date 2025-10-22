// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserAlertBroadcastIndex {
    address public steward;

    struct AlertEntry {
        string alertType; // "OAuth token abuse", "Phishing attempt", "Malicious app detected"
        string broadcastSignal; // "Email warning", "Dashboard notification", "Security bulletin"
        string emotionalTag;
        bool broadcasted;
        bool sealed;
    }

    AlertEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastAlert(string memory alertType, string memory broadcastSignal, string memory emotionalTag) external onlySteward {
        entries.push(AlertEntry(alertType, broadcastSignal, emotionalTag, true, false));
    }

    function sealAlertEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getAlertEntry(uint256 index) external view returns (AlertEntry memory) {
        return entries[index];
    }
}
