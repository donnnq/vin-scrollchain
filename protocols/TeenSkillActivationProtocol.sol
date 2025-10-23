// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TeenSkillActivationProtocol {
    address public steward;

    struct SkillEntry {
        string teenName;
        string skillInterest; // "Digital art", "Coding", "Online selling", "Repair work"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    SkillEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateSkill(string memory teenName, string memory skillInterest, string memory emotionalTag) external onlySteward {
        entries.push(SkillEntry(teenName, skillInterest, emotionalTag, true, false));
    }

    function sealSkillEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getSkillEntry(uint256 index) external view returns (SkillEntry memory) {
        return entries[index];
    }
}
