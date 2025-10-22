// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollchainMediaAuditGrid {
    address public admin;

    struct MediaEntry {
        string broadcaster; // "Chris Chappell"
        string platform; // "America Uncovered"
        string narrativeFocus; // "Trump vs Soros", "IRS weaponization"
        string emotionalTag;
        bool audited;
        bool sealed;
    }

    MediaEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function auditMedia(string memory broadcaster, string memory platform, string memory narrativeFocus, string memory emotionalTag) external onlyAdmin {
        entries.push(MediaEntry(broadcaster, platform, narrativeFocus, emotionalTag, true, false));
    }

    function sealMediaEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getMediaEntry(uint256 index) external view returns (MediaEntry memory) {
        return entries[index];
    }
}
