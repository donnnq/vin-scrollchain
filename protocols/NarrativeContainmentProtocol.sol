// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NarrativeContainmentProtocol {
    address public admin;

    struct ContainmentEntry {
        string broadcaster; // "Chris Chappell"
        string platform; // "America Uncovered"
        string narrativeFocus; // "Trump vs Soros", "IRS weaponization"
        string emotionalTag;
        bool contained;
        bool sealed;
    }

    ContainmentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function containNarrative(string memory broadcaster, string memory platform, string memory narrativeFocus, string memory emotionalTag) external onlyAdmin {
        entries.push(ContainmentEntry(broadcaster, platform, narrativeFocus, emotionalTag, true, false));
    }

    function sealContainmentEntry(uint256 index) external onlyAdmin {
        require(entries[index].contained, "Must be contained first");
        entries[index].sealed = true;
    }

    function getContainmentEntry(uint256 index) external view returns (ContainmentEntry memory) {
        return entries[index];
    }
}
