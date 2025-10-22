// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExportSectorImmunityLedger {
    address public admin;

    struct ImmunityEntry {
        string sector; // "Electronics", "Semiconductors"
        string threatVector; // "US tariffs", "Supply chain disruption"
        string immunityStrategy; // "FTA shielding", "Diversification"
        string emotionalTag;
        bool granted;
        bool sealed;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function grantImmunity(string memory sector, string memory threatVector, string memory immunityStrategy, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(sector, threatVector, immunityStrategy, emotionalTag, true, false));
    }

    function sealImmunityEntry(uint256 index) external onlyAdmin {
        require(entries[index].granted, "Must be granted first");
        entries[index].sealed = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
