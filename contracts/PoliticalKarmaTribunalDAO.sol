// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PoliticalKarmaTribunalDAO {
    address public admin;

    struct TribunalEntry {
        string officialName;
        string violationType;
        string emotionalTag;
        bool summoned;
        bool sentenced;
    }

    TribunalEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTribunal(string memory officialName, string memory violationType, string memory emotionalTag) external onlyAdmin {
        entries.push(TribunalEntry(officialName, violationType, emotionalTag, true, false));
    }

    function sentenceTribunal(uint256 index) external onlyAdmin {
        entries[index].sentenced = true;
    }

    function getTribunal(uint256 index) external view returns (TribunalEntry memory) {
        return entries[index];
    }
}
