// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalCivicCelebrationProtocol {
    address public admin;

    struct CelebrationEntry {
        string city;
        string celebrationType; // "Urban Upgrade", "Tourism Boost", "Public Space Revival"
        string protocolClause;
        string emotionalTag;
        bool summoned;
        bool broadcasted;
        bool sealed;
    }

    CelebrationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonCelebration(string memory city, string memory celebrationType, string memory protocolClause, string memory emotionalTag) external onlyAdmin {
        entries.push(CelebrationEntry(city, celebrationType, protocolClause, emotionalTag, true, false, false));
    }

    function confirmBroadcast(uint256 index) external onlyAdmin {
        entries[index].broadcasted = true;
    }

    function sealCelebrationEntry(uint256 index) external onlyAdmin {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getCelebrationEntry(uint256 index) external view returns (CelebrationEntry memory) {
        return entries[index];
    }
}
