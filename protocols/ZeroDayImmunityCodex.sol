// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ZeroDayImmunityCodex {
    address public admin;

    struct ImmunityEntry {
        string cveID;
        string exploitVector;
        string containmentStatus;
        string emotionalTag;
        bool summoned;
        bool neutralized;
        bool sealed;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonImmunity(string memory cveID, string memory exploitVector, string memory containmentStatus, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(cveID, exploitVector, containmentStatus, emotionalTag, true, false, false));
    }

    function confirmNeutralization(uint256 index) external onlyAdmin {
        entries[index].neutralized = true;
    }

    function sealImmunity(uint256 index) external onlyAdmin {
        require(entries[index].neutralized, "Must be neutralized first");
        entries[index].sealed = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
