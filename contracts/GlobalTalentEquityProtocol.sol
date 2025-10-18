// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalTalentEquityProtocol {
    address public admin;

    struct TalentEntry {
        string innovatorName;
        string countryOrigin;
        string fieldOfImpact;
        string emotionalTag;
        bool summoned;
        bool verified;
    }

    TalentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTalent(string memory innovatorName, string memory countryOrigin, string memory fieldOfImpact, string memory emotionalTag) external onlyAdmin {
        entries.push(TalentEntry(innovatorName, countryOrigin, fieldOfImpact, emotionalTag, true, false));
    }

    function verifyTalent(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function getTalentEntry(uint256 index) external view returns (TalentEntry memory) {
        return entries[index];
    }
}
