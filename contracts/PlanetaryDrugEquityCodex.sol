// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryDrugEquityCodex {
    address public admin;

    struct EquityEntry {
        string drugName;
        string targetCondition;
        string emotionalTag;
        bool summoned;
        bool distributed;
    }

    EquityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonEquity(string memory drugName, string memory targetCondition, string memory emotionalTag) external onlyAdmin {
        entries.push(EquityEntry(drugName, targetCondition, emotionalTag, true, false));
    }

    function distributeEquity(uint256 index) external onlyAdmin {
        entries[index].distributed = true;
    }

    function getEquityEntry(uint256 index) external view returns (EquityEntry memory) {
        return entries[index];
    }
}
