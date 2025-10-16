// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateOversightRitualPack {
    address public admin;

    struct OversightEntry {
        string committeeLabel;
        string investigationFocus;
        string emotionalTag;
        bool convened;
        bool concluded;
    }

    OversightEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function conveneOversight(string memory committeeLabel, string memory investigationFocus, string memory emotionalTag) external onlyAdmin {
        entries.push(OversightEntry(committeeLabel, investigationFocus, emotionalTag, true, false));
    }

    function concludeOversight(uint256 index) external onlyAdmin {
        entries[index].concluded = true;
    }

    function getEntry(uint256 index) external view returns (OversightEntry memory) {
        return entries[index];
    }
}
