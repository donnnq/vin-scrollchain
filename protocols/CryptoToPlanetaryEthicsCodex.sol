// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CryptoToPlanetaryEthicsCodex {
    address public steward;

    struct EthicsEntry {
        string projectName; // "Binance, Ethereum, Solana"
        string ethicsClause; // "Scrollchain-sealed ledger of environmental impact, labor dignity, and sovereignty alignment"
        string emotionalTag;
        bool inscribed;
        bool sealed;
    }

    EthicsEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function inscribeEthics(string memory projectName, string memory ethicsClause, string memory emotionalTag) external onlySteward {
        entries.push(EthicsEntry(projectName, ethicsClause, emotionalTag, true, false));
    }

    function sealEthicsEntry(uint256 index) external onlySteward {
        require(entries[index].inscribed, "Must be inscribed first");
        entries[index].sealed = true;
    }

    function getEthicsEntry(uint256 index) external view returns (EthicsEntry memory) {
        return entries[index];
    }
}
