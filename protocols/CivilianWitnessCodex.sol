// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivilianWitnessCodex {
    address public admin;

    struct WitnessEntry {
        string location;
        string incident;
        string civicClause;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    WitnessEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonWitness(string memory location, string memory incident, string memory civicClause, string memory emotionalTag) external onlyAdmin {
        entries.push(WitnessEntry(location, incident, civicClause, emotionalTag, true, false, false));
    }

    function confirmVerification(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealWitnessEntry(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getWitnessEntry(uint256 index) external view returns (WitnessEntry memory) {
        return entries[index];
    }
}
