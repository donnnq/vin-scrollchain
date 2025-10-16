// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MayorVerificationCodex {
    address public admin;

    struct VerificationEntry {
        string mayorName;
        string projectLabel;
        string verificationNote;
        string emotionalTag;
        bool signedOff;
    }

    VerificationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory mayorName, string memory projectLabel, string memory verificationNote, string memory emotionalTag) external onlyAdmin {
        entries.push(VerificationEntry(mayorName, projectLabel, verificationNote, emotionalTag, false));
    }

    function signOffEntry(uint256 index) external onlyAdmin {
        entries[index].signedOff = true;
    }

    function getEntry(uint256 index) external view returns (VerificationEntry memory) {
        return entries[index];
    }
}
