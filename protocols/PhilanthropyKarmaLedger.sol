// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PhilanthropyKarmaLedger {
    address public admin;

    struct KarmaEntry {
        string foundationName; // "Open Society Foundations"
        string founder; // "George Soros"
        string karmicSignal; // "IRS scrutiny", "Political backlash"
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

    function logKarma(string memory foundationName, string memory founder, string memory karmicSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(KarmaEntry(foundationName, founder, karmicSignal, emotionalTag, true, false));
    }

    function sealKarmaEntry(uint256 index) external onlyAdmin {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getKarmaEntry(uint256 index) external view returns (KarmaEntry memory) {
        return entries[index];
    }
}
