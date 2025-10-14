// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BitcoinEnergyDiplomacyCodexDAO {
    address public admin;

    struct DiplomacyEntry {
        string country;
        string energyExportType;
        string bitcoinMiningClause;
        string emotionalTag;
        bool ratified;
    }

    DiplomacyEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _country, string memory _energyExportType, string memory _bitcoinMiningClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(DiplomacyEntry(_country, _energyExportType, _bitcoinMiningClause, _emotionalTag, false));
    }

    function ratifyEntry(uint256 index) external onlyAdmin {
        codex[index].ratified = true;
    }

    function getEntry(uint256 index) external view returns (DiplomacyEntry memory) {
        return codex[index];
    }
}
