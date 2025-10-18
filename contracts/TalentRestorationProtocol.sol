// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TalentRestorationProtocol {
    address public admin;

    struct RestorationEntry {
        string talentName;
        string domain;
        string emotionalTag;
        bool summoned;
        bool restored;
    }

    RestorationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRestoration(string memory talentName, string memory domain, string memory emotionalTag) external onlyAdmin {
        entries.push(RestorationEntry(talentName, domain, emotionalTag, true, false));
    }

    function restoreTalent(uint256 index) external onlyAdmin {
        entries[index].restored = true;
    }

    function getRestorationEntry(uint256 index) external view returns (RestorationEntry memory) {
        return entries[index];
    }
}
