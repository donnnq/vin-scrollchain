// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ShelterEquityCodex {
    address public admin;

    struct EquityEntry {
        string city;
        string shelterType;
        string equityClause;
        string emotionalTag;
        bool summoned;
        bool ratified;
        bool sealed;
    }

    EquityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonEquity(string memory city, string memory shelterType, string memory equityClause, string memory emotionalTag) external onlyAdmin {
        entries.push(EquityEntry(city, shelterType, equityClause, emotionalTag, true, false, false));
    }

    function confirmRatification(uint256 index) external onlyAdmin {
        entries[index].ratified = true;
    }

    function sealEquityEntry(uint256 index) external onlyAdmin {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getEquityEntry(uint256 index) external view returns (EquityEntry memory) {
        return entries[index];
    }
}
