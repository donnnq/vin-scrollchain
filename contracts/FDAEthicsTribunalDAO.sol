// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FDAEthicsTribunalDAO {
    address public admin;

    struct TribunalEntry {
        string drugName;
        string trialPhase;
        string emotionalTag;
        bool summoned;
        bool reviewed;
    }

    TribunalEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTribunal(string memory drugName, string memory trialPhase, string memory emotionalTag) external onlyAdmin {
        entries.push(TribunalEntry(drugName, trialPhase, emotionalTag, true, false));
    }

    function reviewTribunal(uint256 index) external onlyAdmin {
        entries[index].reviewed = true;
    }

    function getTribunalEntry(uint256 index) external view returns (TribunalEntry memory) {
        return entries[index];
    }
}
