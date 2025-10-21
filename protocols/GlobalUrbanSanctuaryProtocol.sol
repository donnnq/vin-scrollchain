// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalUrbanSanctuaryProtocol {
    address public admin;

    struct SanctuaryEntry {
        string city;
        string sanctuaryType; // "Forest Park", "River Esplanade", "Quiet Zone"
        string protocolClause;
        string emotionalTag;
        bool summoned;
        bool activated;
        bool sealed;
    }

    SanctuaryEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSanctuary(string memory city, string memory sanctuaryType, string memory protocolClause, string memory emotionalTag) external onlyAdmin {
        entries.push(SanctuaryEntry(city, sanctuaryType, protocolClause, emotionalTag, true, false, false));
    }

    function confirmActivation(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function sealSanctuaryEntry(uint256 index) external onlyAdmin {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getSanctuaryEntry(uint256 index) external view returns (SanctuaryEntry memory) {
        return entries[index];
    }
}
