// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VeteranRecallCodex {
    address public admin;

    struct RecallEntry {
        string country;
        string recallType;
        string mobilizationClause;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    RecallEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRecall(string memory country, string memory recallType, string memory mobilizationClause, string memory emotionalTag) external onlyAdmin {
        entries.push(RecallEntry(country, recallType, mobilizationClause, emotionalTag, true, false, false));
    }

    function confirmVerification(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealRecallEntry(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getRecallEntry(uint256 index) external view returns (RecallEntry memory) {
        return entries[index];
    }
}
