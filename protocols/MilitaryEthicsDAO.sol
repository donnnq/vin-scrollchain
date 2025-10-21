// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MilitaryEthicsDAO {
    address public admin;

    struct EthicsEntry {
        string country;
        string incident;
        string ethicsClause;
        string emotionalTag;
        bool summoned;
        bool reviewed;
        bool sealed;
    }

    EthicsEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonEthicsEntry(string memory country, string memory incident, string memory ethicsClause, string memory emotionalTag) external onlyAdmin {
        entries.push(EthicsEntry(country, incident, ethicsClause, emotionalTag, true, false, false));
    }

    function confirmReview(uint256 index) external onlyAdmin {
        entries[index].reviewed = true;
    }

    function sealEthicsEntry(uint256 index) external onlyAdmin {
        require(entries[index].reviewed, "Must be reviewed first");
        entries[index].sealed = true;
    }

    function getEthicsEntry(uint256 index) external view returns (EthicsEntry memory) {
        return entries[index];
    }
}
