// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HumanSignalAmplificationDAO {
    address public admin;

    struct SignalEntry {
        string userLabel;
        string signalType;
        string emotionalTag;
        bool amplified;
    }

    SignalEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory userLabel, string memory signalType, string memory emotionalTag) external onlyAdmin {
        entries.push(SignalEntry(userLabel, signalType, emotionalTag, false));
    }

    function amplifyEntry(uint256 index) external onlyAdmin {
        entries[index].amplified = true;
    }

    function getEntry(uint256 index) external view returns (SignalEntry memory) {
        return entries[index];
    }
}
