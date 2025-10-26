// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScreenshotToSourceVerificationGrid {
    address public steward;

    struct VerificationEntry {
        string screenshotContext; // "Political post, viral claim, emotional bait"
        string verificationClause; // "Scrollchain-sealed reminder to verify source before reacting or sharing"
        string emotionalTag;
        bool indexed;
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

    function indexVerification(string memory screenshotContext, string memory verificationClause, string memory emotionalTag) external onlySteward {
        entries.push(VerificationEntry(screenshotContext, verificationClause, emotionalTag, true, false));
    }

    function sealVerificationEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getVerificationEntry(uint256 index) external view returns (VerificationEntry memory) {
        return entries[index];
    }
}
