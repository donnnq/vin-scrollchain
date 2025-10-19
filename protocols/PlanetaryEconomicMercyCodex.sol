// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryEconomicMercyCodex {
    address public admin;

    struct MercyEntry {
        string countryName;
        string creditorEntity;
        string mercyType;
        string emotionalTag;
        bool summoned;
        bool declared;
        bool sealed;
    }

    MercyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonMercy(string memory countryName, string memory creditorEntity, string memory mercyType, string memory emotionalTag) external onlyAdmin {
        entries.push(MercyEntry(countryName, creditorEntity, mercyType, emotionalTag, true, false, false));
    }

    function confirmDeclaration(uint256 index) external onlyAdmin {
        entries[index].declared = true;
    }

    function sealMercyEntry(uint256 index) external onlyAdmin {
        require(entries[index].declared, "Must be declared first");
        entries[index].sealed = true;
    }

    function getMercyEntry(uint256 index) external view returns (MercyEntry memory) {
        return entries[index];
    }
}
