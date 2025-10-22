// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExportResilienceTreatyTracker {
    address public admin;

    struct TreatyEntry {
        string country; // "Philippines"
        string treatyPartner; // "EU", "Canada", "Chile"
        string exportSector; // "Electronics", "Agriculture"
        string resilienceImpact; // "High", "Moderate", "Low"
        string emotionalTag;
        bool tracked;
        bool sealed;
    }

    TreatyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function trackTreaty(string memory country, string memory treatyPartner, string memory exportSector, string memory resilienceImpact, string memory emotionalTag) external onlyAdmin {
        entries.push(TreatyEntry(country, treatyPartner, exportSector, resilienceImpact, emotionalTag, true, false));
    }

    function sealTreatyEntry(uint256 index) external onlyAdmin {
        require(entries[index].tracked, "Must be tracked first");
        entries[index].sealed = true;
    }

    function getTreatyEntry(uint256 index) external view returns (TreatyEntry memory) {
        return entries[index];
    }
}
