// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalKarmaTribunalDAO {
    address public admin;

    struct TribunalEntry {
        string actorName;
        string digitalViolation;
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

    function summonTribunal(string memory actorName, string memory digitalViolation, string memory emotionalTag) external onlyAdmin {
        entries.push(TribunalEntry(actorName, digitalViolation, emotionalTag, true, false));
    }

    function sentenceTribunal(uint256 index) external onlyAdmin {
        entries[index].sentenced = true;
    }

    function getTribunal(uint256 index) external view returns (TribunalEntry memory) {
        return entries[index];
    }
}
