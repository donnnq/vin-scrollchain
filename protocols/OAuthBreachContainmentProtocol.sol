// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OAuthBreachContainmentProtocol {
    address public steward;

    struct BreachEntry {
        string breachVector; // "OAuth token abuse", "Malicious app injection", "Post-password reset access"
        string containmentSignal; // "Token revocation", "App audit", "User alert"
        string emotionalTag;
        bool contained;
        bool sealed;
    }

    BreachEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function containBreach(string memory breachVector, string memory containmentSignal, string memory emotionalTag) external onlySteward {
        entries.push(BreachEntry(breachVector, containmentSignal, emotionalTag, true, false));
    }

    function sealBreachEntry(uint256 index) external onlySteward {
        require(entries[index].contained, "Must be contained first");
        entries[index].sealed = true;
    }

    function getBreachEntry(uint256 index) external view returns (BreachEntry memory) {
        return entries[index];
    }
}
