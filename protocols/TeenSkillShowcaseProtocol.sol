// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TeenSkillShowcaseProtocol {
    address public steward;

    struct ShowcaseEntry {
        string teenName;
        string skillType; // "Digital art", "Crafts", "Coding", "Food prep"
        string showcaseSignal; // "Barangay fair", "Online gallery", "Community bulletin"
        string emotionalTag;
        bool showcased;
        bool sealed;
    }

    ShowcaseEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function showcaseSkill(string memory teenName, string memory skillType, string memory showcaseSignal, string memory emotionalTag) external onlySteward {
        entries.push(ShowcaseEntry(teenName, skillType, showcaseSignal, emotionalTag, true, false));
    }

    function sealShowcaseEntry(uint256 index) external onlySteward {
        require(entries[index].showcased, "Must be showcased first");
        entries[index].sealed = true;
    }

    function getShowcaseEntry(uint256 index) external view returns (ShowcaseEntry memory) {
        return entries[index];
    }
}
