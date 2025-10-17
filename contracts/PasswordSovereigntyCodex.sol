// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PasswordSovereigntyCodex {
    address public admin;

    struct PasswordEntry {
        string vaultName;
        string ownerName;
        string backupMethod;
        string emotionalTag;
        bool secured;
        bool breached;
    }

    PasswordEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logPassword(string memory vaultName, string memory ownerName, string memory backupMethod, string memory emotionalTag) external onlyAdmin {
        entries.push(PasswordEntry(vaultName, ownerName, backupMethod, emotionalTag, true, false));
    }

    function markBreached(uint256 index) external onlyAdmin {
        entries[index].breached = true;
    }

    function getPassword(uint256 index) external view returns (PasswordEntry memory) {
        return entries[index];
    }
}
