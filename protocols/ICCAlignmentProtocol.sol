// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ICCAlignmentProtocol {
    address public admin;

    struct AlignmentEntry {
        string oversightBody; // "International Criminal Court"
        string alignmentSignal; // "Infrastructure corruption", "Graft escalation", "Global treaty compliance"
        string emotionalTag;
        bool aligned;
        bool sealed;
    }

    AlignmentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function alignICC(string memory oversightBody, string memory alignmentSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(AlignmentEntry(oversightBody, alignmentSignal, emotionalTag, true, false));
    }

    function sealAlignmentEntry(uint256 index) external onlyAdmin {
        require(entries[index].aligned, "Must be aligned first");
        entries[index].sealed = true;
    }

    function getAlignmentEntry(uint256 index) external view returns (AlignmentEntry memory) {
        return entries[index];
    }
}
