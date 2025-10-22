// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicForumIntegrityIndex {
    address public admin;

    struct IntegrityEntry {
        string forumType; // "Senate hearing", "Town hall", "Online debate"
        string integritySignal; // "Truth defense", "Redundancy objection", "Institutional sovereignty"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    IntegrityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function indexForum(string memory forumType, string memory integritySignal, string memory emotionalTag) external onlyAdmin {
        entries.push(IntegrityEntry(forumType, integritySignal, emotionalTag, true, false));
    }

    function sealIntegrityEntry(uint256 index) external onlyAdmin {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getIntegrityEntry(uint256 index) external view returns (IntegrityEntry memory) {
        return entries[index];
    }
}
