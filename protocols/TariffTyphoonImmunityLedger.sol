// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TariffTyphoonImmunityLedger {
    address public admin;

    struct ImmunityEntry {
        string country; // "Philippines"
        string tariffImpact; // "19% levy", "13.1% export drop"
        string immunityStrategy; // "FTA expansion", "ASEAN leverage"
        string emotionalTag;
        bool logged;
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

    function logImmunity(string memory country, string memory tariffImpact, string memory immunityStrategy, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(country, tariffImpact, immunityStrategy, emotionalTag, true, false));
    }

    function sealImmunityEntry(uint256 index) external onlyAdmin {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
