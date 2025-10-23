// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicTribunalToPolicyReformIndex {
    address public steward;

    struct ReformEntry {
        string tribunalCase;
        string reformProposal; // "Automatic enforcement", "Transparency mandate", "Leadership accountability clause"
        string legislativeBody; // "Senate", "Congress", "Public tribunal"
        string emotionalTag;
        bool proposed;
        bool sealed;
    }

    ReformEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function proposeReform(string memory tribunalCase, string memory reformProposal, string memory legislativeBody, string memory emotionalTag) external onlySteward {
        entries.push(ReformEntry(tribunalCase, reformProposal, legislativeBody, emotionalTag, true, false));
    }

    function sealReformEntry(uint256 index) external onlySteward {
        require(entries[index].proposed, "Must be proposed first");
        entries[index].sealed = true;
    }

    function getReformEntry(uint256 index) external view returns (ReformEntry memory) {
        return entries[index];
    }
}
