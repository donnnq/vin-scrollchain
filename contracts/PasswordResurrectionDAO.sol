// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PasswordResurrectionDAO {
    address public admin;

    struct ResurrectionEntry {
        string vaultName;
        string ownerName;
        string recoveryMethod;
        string emotionalTag;
        bool attempted;
        bool resurrected;
    }

    ResurrectionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logAttempt(string memory vaultName, string memory ownerName, string memory recoveryMethod, string memory emotionalTag) external onlyAdmin {
        entries.push(ResurrectionEntry(vaultName, ownerName, recoveryMethod, emotionalTag, true, false));
    }

    function markResurrected(uint256 index) external onlyAdmin {
        entries[index].resurrected = true;
    }

    function getAttempt(uint256 index) external view returns (ResurrectionEntry memory) {
        return entries[index];
    }
}
