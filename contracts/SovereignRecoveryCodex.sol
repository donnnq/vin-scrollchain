// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SovereignRecoveryCodex {
    address public admin;

    struct RecoveryEntry {
        string vaultName;
        string recoveryMethod;
        string emotionalTag;
        bool initiated;
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

    function initiateRecovery(string memory vaultName, string memory recoveryMethod, string memory emotionalTag) external onlyAdmin {
        entries.push(RecoveryEntry(vaultName, recoveryMethod, emotionalTag, true, false));
    }

    function markCompleted(uint256 index) external onlyAdmin {
        entries[index].completed = true;
    }

    function getRecovery(uint256 index) external view returns (RecoveryEntry memory) {
        return entries[index];
    }
}
