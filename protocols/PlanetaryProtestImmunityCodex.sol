// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryProtestImmunityCodex {
    address public admin;

    struct ProtestEntry {
        string location;
        string cause;
        string emotionalTag;
        bool summoned;
        bool protected;
        bool sealed;
    }

    ProtestEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonProtest(string memory location, string memory cause, string memory emotionalTag) external onlyAdmin {
        entries.push(ProtestEntry(location, cause, emotionalTag, true, false, false));
    }

    function protectProtest(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealImmunity(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getProtestEntry(uint256 index) external view returns (ProtestEntry memory) {
        return entries[index];
    }
}
