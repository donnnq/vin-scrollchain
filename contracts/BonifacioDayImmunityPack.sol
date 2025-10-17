// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BonifacioDayImmunityPack {
    address public admin;

    struct ImmunityEntry {
        string protestZone;
        string protectionProtocol;
        string emotionalTag;
        bool summoned;
        bool granted;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonImmunity(string memory protestZone, string memory protectionProtocol, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(protestZone, protectionProtocol, emotionalTag, true, false));
    }

    function grantImmunity(uint256 index) external onlyAdmin {
        entries[index].granted = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
