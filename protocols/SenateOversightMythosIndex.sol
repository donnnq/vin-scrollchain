// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateOversightMythosIndex {
    address public admin;

    struct MythosEntry {
        string billNumber; // "SB No. 1215"
        string debateSignal; // "Drilon's objection", "Oversight clarity", "Institutional strengthening"
        string mythosTag; // "Governance integrity", "Anti-corruption clarity"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    MythosEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function indexMythos(string memory billNumber, string memory debateSignal, string memory mythosTag, string memory emotionalTag) external onlyAdmin {
        entries.push(MythosEntry(billNumber, debateSignal, mythosTag, emotionalTag, true, false));
    }

    function sealMythosEntry(uint256 index) external onlyAdmin {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getMythosEntry(uint256 index) external view returns (MythosEntry memory) {
        return entries[index];
    }
}
