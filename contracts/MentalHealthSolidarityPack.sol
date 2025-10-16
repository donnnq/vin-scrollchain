// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MentalHealthSolidarityPack {
    address public admin;

    struct SolidarityEntry {
        string personLabel;
        string emotionalState;
        string supportMessage;
        bool acknowledged;
        bool ritualized;
    }

    SolidarityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitSolidarity(string memory personLabel, string memory emotionalState, string memory supportMessage) external onlyAdmin {
        entries.push(SolidarityEntry(personLabel, emotionalState, supportMessage, false, false));
    }

    function acknowledgeSolidarity(uint256 index) external onlyAdmin {
        entries[index].acknowledged = true;
    }

    function ritualizeSolidarity(uint256 index) external onlyAdmin {
        entries[index].ritualized = true;
    }

    function getSolidarity(uint256 index) external view returns (SolidarityEntry memory) {
        return entries[index];
    }
}
