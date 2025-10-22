// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AuditSatireBroadcastProtocol {
    address public admin;

    struct BroadcastEntry {
        string broadcaster; // "Chris Chappell"
        string satireTitle; // "Trump’s IRS vs Soros"
        string platform; // "America Uncovered"
        string emotionalTag;
        bool broadcasted;
        bool sealed;
    }

    BroadcastEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logBroadcast(string memory broadcaster, string memory satireTitle, string memory platform, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(broadcaster, satireTitle, platform, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlyAdmin {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
