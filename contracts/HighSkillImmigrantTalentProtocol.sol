// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HighSkillImmigrantTalentProtocol {
    address public admin;

    struct TalentEntry {
        string skillDomain;
        string immigrantName;
        string exemptionReason;
        string emotionalTag;
        bool summoned;
        bool validated;
    }

    TalentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTalent(string memory skillDomain, string memory immigrantName, string memory exemptionReason, string memory emotionalTag) external onlyAdmin {
        entries.push(TalentEntry(skillDomain, immigrantName, exemptionReason, emotionalTag, true, false));
    }

    function validateTalent(uint256 index) external onlyAdmin {
        entries[index].validated = true;
    }

    function getTalentEntry(uint256 index) external view returns (TalentEntry memory) {
        return entries[index];
    }
}
