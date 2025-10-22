// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MaliciousAppDetectionGrid {
    address public steward;

    struct AppEntry {
        string appName; // "Internal phishing app", "Token hijacker"
        string detectionSignal; // "Unusual permissions", "Persistent access", "Unverified origin"
        string emotionalTag;
        bool detected;
        bool sealed;
    }

    AppEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function detectApp(string memory appName, string memory detectionSignal, string memory emotionalTag) external onlySteward {
        entries.push(AppEntry(appName, detectionSignal, emotionalTag, true, false));
    }

    function sealAppEntry(uint256 index) external onlySteward {
        require(entries[index].detected, "Must be detected first");
        entries[index].sealed = true;
    }

    function getAppEntry(uint256 index) external view returns (AppEntry memory) {
        return entries[index];
    }
}
