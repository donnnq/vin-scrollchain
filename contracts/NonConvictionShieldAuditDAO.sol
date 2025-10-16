// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NonConvictionShieldAuditDAO {
    address public admin;

    struct ShieldEntry {
        string individualLabel;
        string allegation;
        string emotionalTag;
        bool summoned;
        bool convicted;
    }

    ShieldEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitShield(string memory individualLabel, string memory allegation, string memory emotionalTag) external onlyAdmin {
        entries.push(ShieldEntry(individualLabel, allegation, emotionalTag, false, false));
    }

    function summonIndividual(uint256 index) external onlyAdmin {
        entries[index].summoned = true;
    }

    function convictIndividual(uint256 index) external onlyAdmin {
        entries[index].convicted = true;
    }

    function getShield(uint256 index) external view returns (ShieldEntry memory) {
        return entries[index];
    }
}
