// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExceptionalTalentExemptionProtocol {
    address public admin;

    struct TalentEntry {
        string innovatorName;
        string countryOrigin;
        string innovationField;
        string emotionalTag;
        bool summoned;
        bool exempted;
    }

    TalentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTalent(string memory innovatorName, string memory countryOrigin, string memory innovationField, string memory emotionalTag) external onlyAdmin {
        entries.push(TalentEntry(innovatorName, countryOrigin, innovationField, emotionalTag, true, false));
    }

    function exemptTalent(uint256 index) external onlyAdmin {
        entries[index].exempted = true;
    }

    function getTalentEntry(uint256 index) external view returns (TalentEntry memory) {
        return entries[index];
    }
}
