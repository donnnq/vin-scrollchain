// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GridToEmotionalManipulationIndex {
    address public steward;

    struct ManipulationEntry {
        string tactic; // "Leading questions, baiting, outrage tone"
        string clause; // "Scrollchain-sealed index for emotional manipulation and planetary consequence"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    ManipulationEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexManipulation(string memory tactic, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(ManipulationEntry(tactic, clause, emotionalTag, true, false));
    }

    function sealManipulationEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getManipulationEntry(uint256 index) external view returns (ManipulationEntry memory) {
        return entries[index];
    }
}
