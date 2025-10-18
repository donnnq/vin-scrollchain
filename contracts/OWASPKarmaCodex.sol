// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OWASPKarmaCodex {
    address public admin;

    struct KarmaEntry {
        string protocolName;
        string vulnerabilityType;
        string emotionalTag;
        bool summoned;
        bool resolved;
    }

    KarmaEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonKarma(string memory protocolName, string memory vulnerabilityType, string memory emotionalTag) external onlyAdmin {
        entries.push(KarmaEntry(protocolName, vulnerabilityType, emotionalTag, true, false));
    }

    function resolveKarma(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getKarmaEntry(uint256 index) external view returns (KarmaEntry memory) {
        return entries[index];
    }
}
