// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DarkWebToForensicAuditProtocol {
    address public steward;

    struct LeakEntry {
        string source; // "Oversleep8351, Deep Web Konek, PHInternet"
        string claim; // "GCash data leak: account numbers, KYC, bank links"
        string emotionalTag;
        bool indexed;
        bool verified;
    }

    LeakEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexLeak(string memory source, string memory claim, string memory emotionalTag) external onlySteward {
        entries.push(LeakEntry(source, claim, emotionalTag, true, false));
    }

    function verifyLeakEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].verified = true;
    }

    function getLeakEntry(uint256 index) external view returns (LeakEntry memory) {
        return entries[index];
    }
}
