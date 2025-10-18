// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClinicalSovereigntyFellowshipProtocol {
    address public admin;

    struct FellowshipEntry {
        string trialName;
        string sponsorEntity;
        string emotionalTag;
        bool summoned;
        bool endorsed;
    }

    FellowshipEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonFellowship(string memory trialName, string memory sponsorEntity, string memory emotionalTag) external onlyAdmin {
        entries.push(FellowshipEntry(trialName, sponsorEntity, emotionalTag, true, false));
    }

    function endorseFellowship(uint256 index) external onlyAdmin {
        entries[index].endorsed = true;
    }

    function getFellowshipEntry(uint256 index) external view returns (FellowshipEntry memory) {
        return entries[index];
    }
}
