// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SpecialTalentForcesExemptionDAO {
    address public admin;

    struct ExemptionEntry {
        string innovatorName;
        string exemptionType;
        string emotionalTag;
        bool summoned;
        bool granted;
    }

    ExemptionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonExemption(string memory innovatorName, string memory exemptionType, string memory emotionalTag) external onlyAdmin {
        entries.push(ExemptionEntry(innovatorName, exemptionType, emotionalTag, true, false));
    }

    function grantExemption(uint256 index) external onlyAdmin {
        entries[index].granted = true;
    }

    function getExemptionEntry(uint256 index) external view returns (ExemptionEntry memory) {
        return entries[index];
    }
}
