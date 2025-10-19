// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AyudaEquityCodex {
    address public admin;

    struct AyudaEntry {
        string programName;
        string targetGroup;
        string deliveryMethod;
        string emotionalTag;
        bool summoned;
        bool verified;
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

    function summonAyuda(string memory programName, string memory targetGroup, string memory deliveryMethod, string memory emotionalTag) external onlyAdmin {
        entries.push(AyudaEntry(programName, targetGroup, deliveryMethod, emotionalTag, true, false, false));
    }

    function verifyAyuda(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealAyuda(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getAyudaEntry(uint256 index) external view returns (AyudaEntry memory) {
        return entries[index];
    }
}
