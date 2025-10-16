// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScamSyndicateForensicDAO {
    address public admin;

    struct ForensicEntry {
        string operationName;
        string country;
        string scamType;
        string emotionalTag;
        bool investigated;
        bool exposed;
    }

    ForensicEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logInvestigation(string memory operationName, string memory country, string memory scamType, string memory emotionalTag) external onlyAdmin {
        entries.push(ForensicEntry(operationName, country, scamType, emotionalTag, true, false));
    }

    function exposeSyndicate(uint256 index) external onlyAdmin {
        entries[index].exposed = true;
    }

    function getEntry(uint256 index) external view returns (ForensicEntry memory) {
        return entries[index];
    }
}
