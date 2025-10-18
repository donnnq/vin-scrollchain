// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HumanLedDiscoveryCodex {
    address public admin;

    struct DiscoveryEntry {
        string creatorName;
        string domain;
        string emotionalTag;
        bool summoned;
        bool preserved;
    }

    DiscoveryEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDiscovery(string memory creatorName, string memory domain, string memory emotionalTag) external onlyAdmin {
        entries.push(DiscoveryEntry(creatorName, domain, emotionalTag, true, false));
    }

    function preserveDiscovery(uint256 index) external onlyAdmin {
        entries[index].preserved = true;
    }

    function getDiscoveryEntry(uint256 index) external view returns (DiscoveryEntry memory) {
        return entries[index];
    }
}
