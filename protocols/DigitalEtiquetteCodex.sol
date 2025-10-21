// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalEtiquetteCodex {
    address public admin;

    struct EtiquetteEntry {
        string platform;
        string behaviorType;
        string etiquetteClause;
        string emotionalTag;
        bool summoned;
        bool validated;
        bool sealed;
    }

    EtiquetteEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonEtiquette(string memory platform, string memory behaviorType, string memory etiquetteClause, string memory emotionalTag) external onlyAdmin {
        entries.push(EtiquetteEntry(platform, behaviorType, etiquetteClause, emotionalTag, true, false, false));
    }

    function confirmValidation(uint256 index) external onlyAdmin {
        entries[index].validated = true;
    }

    function sealEtiquetteEntry(uint256 index) external onlyAdmin {
        require(entries[index].validated, "Must be validated first");
        entries[index].sealed = true;
    }

    function getEtiquetteEntry(uint256 index) external view returns (EtiquetteEntry memory) {
        return entries[index];
    }
}
