// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayInfrastructureVerificationCodex {
    address public admin;

    struct VerificationEntry {
        string purokLabel;
        string projectType;
        string verificationNote;
        string emotionalTag;
        bool verified;
    }

    VerificationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory purokLabel, string memory projectType, string memory verificationNote, string memory emotionalTag) external onlyAdmin {
        entries.push(VerificationEntry(purokLabel, projectType, verificationNote, emotionalTag, false));
    }

    function verifyEntry(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function getEntry(uint256 index) external view returns (VerificationEntry memory) {
        return entries[index];
    }
}
