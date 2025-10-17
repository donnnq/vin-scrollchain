// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VaultRitualImmunityCodex {
    address public admin;

    struct ImmunityEntry {
        string vaultName;
        string encryptionType;
        string emotionalTag;
        bool protected;
        bool ritualized;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function protectVault(string memory vaultName, string memory encryptionType, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(vaultName, encryptionType, emotionalTag, true, false));
    }

    function ritualizeVault(uint256 index) external onlyAdmin {
        entries[index].ritualized = true;
    }

    function getVault(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
