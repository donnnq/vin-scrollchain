// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthSkillRegistryCodex {
    address public admin;

    struct SkillEntry {
        string youthID;
        string skillType;
        string registryType;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    SkillEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSkill(string memory youthID, string memory skillType, string memory registryType, string memory emotionalTag) external onlyAdmin {
        entries.push(SkillEntry(youthID, skillType, registryType, emotionalTag, true, false, false));
    }

    function verifySkill(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealSkill(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getSkillEntry(uint256 index) external view returns (SkillEntry memory) {
        return entries[index];
    }
}
