// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RegionalAyudaDAO {
    address public admin;

    struct AyudaEntry {
        string region;
        string programName;
        string targetGroup;
        string emotionalTag;
        bool summoned;
        bool deployed;
        bool sealed;
    }

    AyudaEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAyuda(string memory region, string memory programName, string memory targetGroup, string memory emotionalTag) external onlyAdmin {
        entries.push(AyudaEntry(region, programName, targetGroup, emotionalTag, true, false, false));
    }

    function deployAyuda(uint256 index) external onlyAdmin {
        entries[index].deployed = true;
    }

    function sealAyuda(uint256 index) external onlyAdmin {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getAyudaEntry(uint256 index) external view returns (AyudaEntry memory) {
        return entries[index];
    }
}
