// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InfiltrationCriminalConsequenceProtocol {
    address public admin;

    struct ConsequenceEntry {
        string personName;
        string offenseType;
        string emotionalTag;
        bool summoned;
        bool sentenced;
    }

    ConsequenceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonConsequence(string memory personName, string memory offenseType, string memory emotionalTag) external onlyAdmin {
        entries.push(ConsequenceEntry(personName, offenseType, emotionalTag, true, false));
    }

    function sentenceOffender(uint256 index) external onlyAdmin {
        entries[index].sentenced = true;
    }

    function getConsequenceEntry(uint256 index) external view returns (ConsequenceEntry memory) {
        return entries[index];
    }
}
