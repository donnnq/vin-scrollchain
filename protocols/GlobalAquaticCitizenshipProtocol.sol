// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalAquaticCitizenshipProtocol {
    address public admin;

    struct CitizenshipEntry {
        string riverName;
        string citizenGroup;
        string protocolClause;
        string emotionalTag;
        bool summoned;
        bool recognized;
        bool sealed;
    }

    CitizenshipEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonCitizenship(string memory riverName, string memory citizenGroup, string memory protocolClause, string memory emotionalTag) external onlyAdmin {
        entries.push(CitizenshipEntry(riverName, citizenGroup, protocolClause, emotionalTag, true, false, false));
    }

    function confirmRecognition(uint256 index) external onlyAdmin {
        entries[index].recognized = true;
    }

    function sealCitizenshipEntry(uint256 index) external onlyAdmin {
        require(entries[index].recognized, "Must be recognized first");
        entries[index].sealed = true;
    }

    function getCitizenshipEntry(uint256 index) external view returns (CitizenshipEntry memory) {
        return entries[index];
    }
}
