// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScamSyndicateKarmaTribunalDAO {
    address public admin;

    struct TribunalEntry {
        string operationName;
        string country;
        string violationType;
        string emotionalTag;
        bool heard;
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

    function submitCase(string memory operationName, string memory country, string memory violationType, string memory emotionalTag) external onlyAdmin {
        entries.push(TribunalEntry(operationName, country, violationType, emotionalTag, false, false));
    }

    function markHeard(uint256 index) external onlyAdmin {
        entries[index].heard = true;
    }

    function markSentenced(uint256 index) external onlyAdmin {
        entries[index].sentenced = true;
    }

    function getCase(uint256 index) external view returns (TribunalEntry memory) {
        return entries[index];
    }
}
