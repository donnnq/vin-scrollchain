// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommentToHumanVerificationGrid {
    address public steward;

    struct VerificationEntry {
        string platform; // "YouTube", "Twitter", "Facebook"
        string verificationMethod; // "Scrollchain ID", "Biometric check", "Community witness"
        string dignitySignal; // "Human-only comment", "Bot-free engagement", "Verified reply"
        string emotionalTag;
        bool verified;
        bool sealed;
    }

    VerificationEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function verifyComment(string memory platform, string memory verificationMethod, string memory dignitySignal, string memory emotionalTag) external onlySteward {
        entries.push(VerificationEntry(platform, verificationMethod, dignitySignal, emotionalTag, true, false));
    }

    function sealVerificationEntry(uint256 index) external onlySteward {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getVerificationEntry(uint256 index) external view returns (VerificationEntry memory) {
        return entries[index];
    }
}
