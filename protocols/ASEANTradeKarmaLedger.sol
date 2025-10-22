// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ASEANTradeKarmaLedger {
    address public admin;

    struct KarmaEntry {
        string memberCountry; // "Philippines", "Vietnam", "Singapore"
        string tradeAction; // "FTA signing", "Tariff resistance", "Market shift"
        string consequenceSignal; // "Export boost", "Strategic gain", "Resilience upgrade"
        string emotionalTag;
        bool logged;
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

    function logKarma(string memory memberCountry, string memory tradeAction, string memory consequenceSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(KarmaEntry(memberCountry, tradeAction, consequenceSignal, emotionalTag, true, false));
    }

    function sealKarmaEntry(uint256 index) external onlyAdmin {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getKarmaEntry(uint256 index) external view returns (KarmaEntry memory) {
        return entries[index];
    }
}
