// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthToNuclearLiteracyProtocol {
    address public steward;

    struct LiteracyEntry {
        string targetSector; // "Students, youth leaders, science clubs"
        string curriculumFocus; // "Nuclear safety, energy ethics, climate impact"
        string emotionalTag;
        bool deployed;
        bool sealed;
    }

    LiteracyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function deployLiteracy(string memory targetSector, string memory curriculumFocus, string memory emotionalTag) external onlySteward {
        entries.push(LiteracyEntry(targetSector, curriculumFocus, emotionalTag, true, false));
    }

    function sealLiteracyEntry(uint256 index) external onlySteward {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getLiteracyEntry(uint256 index) external view returns (LiteracyEntry memory) {
        return entries[index];
    }
}
