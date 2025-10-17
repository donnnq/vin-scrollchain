// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProtestSafetyBroadcastPack {
    address public admin;

    struct SafetyEntry {
        string rallyLocation;
        string safetyProtocol;
        string emotionalTag;
        bool aired;
        bool archived;
    }

    SafetyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBroadcast(string memory rallyLocation, string memory safetyProtocol, string memory emotionalTag) external onlyAdmin {
        entries.push(SafetyEntry(rallyLocation, safetyProtocol, emotionalTag, false, false));
    }

    function airBroadcast(uint256 index) external onlyAdmin {
        entries[index].aired = true;
    }

    function archiveBroadcast(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getSafetyEntry(uint256 index) external view returns (SafetyEntry memory) {
        return entries[index];
    }
}
