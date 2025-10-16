// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScamSyndicateForensicFellowship {
    address public admin;

    struct FellowshipEntry {
        string operationName;
        string country;
        string scamType;
        string emotionalTag;
        bool investigated;
        bool prosecuted;
    }

    FellowshipEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logInvestigation(string memory operationName, string memory country, string memory scamType, string memory emotionalTag) external onlyAdmin {
        entries.push(FellowshipEntry(operationName, country, scamType, emotionalTag, true, false));
    }

    function markProsecuted(uint256 index) external onlyAdmin {
        entries[index].prosecuted = true;
    }

    function getFellowship(uint256 index) external view returns (FellowshipEntry memory) {
        return entries[index];
    }
}
