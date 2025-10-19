// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SovereignDebtJubileeDAO {
    address public admin;

    struct JubileeEntry {
        string countryName;
        string creditorEntity;
        string jubileeReason;
        string emotionalTag;
        bool summoned;
        bool declared;
        bool sealed;
    }

    JubileeEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonJubilee(string memory countryName, string memory creditorEntity, string memory jubileeReason, string memory emotionalTag) external onlyAdmin {
        entries.push(JubileeEntry(countryName, creditorEntity, jubileeReason, emotionalTag, true, false, false));
    }

    function confirmDeclaration(uint256 index) external onlyAdmin {
        entries[index].declared = true;
    }

    function sealJubileeEntry(uint256 index) external onlyAdmin {
        require(entries[index].declared, "Must be declared first");
        entries[index].sealed = true;
    }

    function getJubileeEntry(uint256 index) external view returns (JubileeEntry memory) {
        return entries[index];
    }
}
