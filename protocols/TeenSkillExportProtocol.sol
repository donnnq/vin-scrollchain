// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TeenSkillExportProtocol {
    address public steward;

    struct ExportEntry {
        string teenName;
        string skillType; // "Digital art", "Crafts", "Coding", "Voice acting"
        string exportChannel; // "Online marketplace", "Freelance platform", "Global showcase"
        string emotionalTag;
        bool exported;
        bool sealed;
    }

    ExportEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function exportSkill(string memory teenName, string memory skillType, string memory exportChannel, string memory emotionalTag) external onlySteward {
        entries.push(ExportEntry(teenName, skillType, exportChannel, emotionalTag, true, false));
    }

    function sealExportEntry(uint256 index) external onlySteward {
        require(entries[index].exported, "Must be exported first");
        entries[index].sealed = true;
    }

    function getExportEntry(uint256 index) external view returns (ExportEntry memory) {
        return entries[index];
    }
}
