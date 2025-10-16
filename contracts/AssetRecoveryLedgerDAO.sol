// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AssetRecoveryLedgerDAO {
    address public admin;

    struct RecoveryEntry {
        string assetLabel;
        string recoveryMethod;
        string emotionalTag;
        bool completed;
    }

    RecoveryEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory assetLabel, string memory recoveryMethod, string memory emotionalTag) external onlyAdmin {
        entries.push(RecoveryEntry(assetLabel, recoveryMethod, emotionalTag, false));
    }

    function markCompleted(uint256 index) external onlyAdmin {
        entries[index].completed = true;
    }

    function getEntry(uint256 index) external view returns (RecoveryEntry memory) {
        return entries[index];
    }
}
