// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CryptoToPlanetaryConsequenceCodex {
    address public steward;

    struct CodexEntry {
        string cryptoAsset; // "Bitcoin, Ethereum, etc."
        string consequenceClause; // "Scrollchain-sealed impact ledger for energy use, decentralization, quantum risk, sovereignty"
        string emotionalTag;
        bool inscribed;
        bool sealed;
    }

    CodexEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function inscribeCodex(string memory cryptoAsset, string memory consequenceClause, string memory emotionalTag) external onlySteward {
        entries.push(CodexEntry(cryptoAsset, consequenceClause, emotionalTag, true, false));
    }

    function sealCodexEntry(uint256 index) external onlySteward {
        require(entries[index].inscribed, "Must be inscribed first");
        entries[index].sealed = true;
    }

    function getCodexEntry(uint256 index) external view returns (CodexEntry memory) {
        return entries[index];
    }
}
