// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GameImporterEntryPack {
    address public admin;

    struct Entry {
        string candidateName;
        string gameProposal;
        string emotionalTag;
        bool paid;
        bool selected;
    }

    Entry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory candidateName, string memory gameProposal, string memory emotionalTag) external onlyAdmin {
        entries.push(Entry(candidateName, gameProposal, emotionalTag, false, false));
    }

    function markPaid(uint256 index) external onlyAdmin {
        entries[index].paid = true;
    }

    function selectCandidate(uint256 index) external onlyAdmin {
        entries[index].selected = true;
    }

    function getEntry(uint256 index) external view returns (Entry memory) {
        return entries[index];
    }
}
