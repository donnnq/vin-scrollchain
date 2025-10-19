// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiplomaticCyberBreachKarmaCodex {
    address public admin;

    struct BreachKarmaEntry {
        string targetAgency;
        string country;
        string malwareUsed;
        string emotionalTag;
        bool summoned;
        bool tagged;
        bool sealed;
    }

    BreachKarmaEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonBreachKarma(string memory targetAgency, string memory country, string memory malwareUsed, string memory emotionalTag) external onlyAdmin {
        entries.push(BreachKarmaEntry(targetAgency, country, malwareUsed, emotionalTag, true, false, false));
    }

    function tagBreachKarma(uint256 index) external onlyAdmin {
        entries[index].tagged = true;
    }

    function sealBreachKarma(uint256 index) external onlyAdmin {
        require(entries[index].tagged, "Must be tagged first");
        entries[index].sealed = true;
    }

    function getBreachKarmaEntry(uint256 index) external view returns (BreachKarmaEntry memory) {
        return entries[index];
    }
}
