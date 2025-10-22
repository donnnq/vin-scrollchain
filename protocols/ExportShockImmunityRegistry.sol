// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExportShockImmunityRegistry {
    address public admin;

    struct ImmunityEntry {
        string sector; // "Electronics", "Agriculture"
        string shockType; // "Tariff spike", "Demand collapse"
        string immunityMechanism; // "FTA buffer", "Diversified routing"
        string emotionalTag;
        bool registered;
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

    function registerImmunity(string memory sector, string memory shockType, string memory immunityMechanism, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(sector, shockType, immunityMechanism, emotionalTag, true, false));
    }

    function sealImmunityEntry(uint256 index) external onlyAdmin {
        require(entries[index].registered, "Must be registered first");
        entries[index].sealed = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
