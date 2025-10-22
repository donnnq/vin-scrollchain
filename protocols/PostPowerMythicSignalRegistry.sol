// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PostPowerMythicSignalRegistry {
    address public admin;

    struct SignalEntry {
        string individualName;
        string mythicSignal; // "Quote", "Gesture", "Public appearance"
        string platform; // "News", "Social Media", "Comment Section"
        string emotionalTag;
        bool registered;
        bool sealed;
    }

    SignalEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerSignal(string memory individualName, string memory mythicSignal, string memory platform, string memory emotionalTag) external onlyAdmin {
        entries.push(SignalEntry(individualName, mythicSignal, platform, emotionalTag, true, false));
    }

    function sealSignalEntry(uint256 index) external onlyAdmin {
        require(entries[index].registered, "Must be registered first");
        entries[index].sealed = true;
    }

    function getSignalEntry(uint256 index) external view returns (SignalEntry memory) {
        return entries[index];
    }
}
