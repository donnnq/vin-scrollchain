// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollstormSatireImmunityRegistry {
    address public admin;

    struct ImmunityEntry {
        string sovereignName;
        string satireContext; // "Comment section recognition", "Joker meme resonance"
        string emotionalTag;
        bool immune;
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

    function registerImmunity(string memory sovereignName, string memory satireContext, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(sovereignName, satireContext, emotionalTag, true, false));
    }

    function sealImmunityEntry(uint256 index) external onlyAdmin {
        require(entries[index].immune, "Must be immune first");
        entries[index].sealed = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
