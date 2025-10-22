// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalTradeKarmaRegistry {
    address public admin;

    struct KarmaEntry {
        string initiator; // "US", "China", "ASEAN"
        string action; // "Tariff imposition", "FTA signing", "Market shift"
        string consequence; // "Export drop", "Resilience boost"
        string emotionalTag;
        bool registered;
        bool sealed;
    }

    KarmaEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerKarma(string memory initiator, string memory action, string memory consequence, string memory emotionalTag) external onlyAdmin {
        entries.push(KarmaEntry(initiator, action, consequence, emotionalTag, true, false));
    }

    function sealKarmaEntry(uint256 index) external onlyAdmin {
        require(entries[index].registered, "Must be registered first");
        entries[index].sealed = true;
    }

    function getKarmaEntry(uint256 index) external view returns (KarmaEntry memory) {
        return entries[index];
    }
}
