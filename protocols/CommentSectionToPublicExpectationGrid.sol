// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommentSectionToPublicExpectationGrid {
    address public steward;

    struct ExpectationEntry {
        string figureName; // "Cong. Sandro Marcos"
        string commentSignal; // "Matalino", "May potential", "Lalaban sa kurap"
        string expectationType; // "Legislative reform", "Youth-led governance"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    ExpectationEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexExpectation(string memory figureName, string memory commentSignal, string memory expectationType, string memory emotionalTag) external onlySteward {
        entries.push(ExpectationEntry(figureName, commentSignal, expectationType, emotionalTag, true, false));
    }

    function sealExpectationEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getExpectationEntry(uint256 index) external view returns (ExpectationEntry memory) {
        return entries[index];
    }
}
