// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VaultImmunityFellowship {
    address public admin;

    struct VaultEntry {
        string vaultName;
        string ownerName;
        string encryptionType;
        string emotionalTag;
        bool protected;
        bool breached;
    }

    VaultEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerVault(string memory vaultName, string memory ownerName, string memory encryptionType, string memory emotionalTag) external onlyAdmin {
        entries.push(VaultEntry(vaultName, ownerName, encryptionType, emotionalTag, true, false));
    }

    function markBreached(uint256 index) external onlyAdmin {
        entries[index].breached = true;
    }

    function getVault(uint256 index) external view returns (VaultEntry memory) {
        return entries[index];
    }
}
