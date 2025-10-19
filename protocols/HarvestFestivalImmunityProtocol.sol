// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HarvestFestivalImmunityProtocol {
    address public admin;

    struct FestivalEntry {
        string festivalName;
        string region;
        string ritualType;
        string emotionalTag;
        bool summoned;
        bool celebrated;
        bool sealed;
    }

    FestivalEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonFestival(string memory festivalName, string memory region, string memory ritualType, string memory emotionalTag) external onlyAdmin {
        entries.push(FestivalEntry(festivalName, region, ritualType, emotionalTag, true, false, false));
    }

    function confirmCelebration(uint256 index) external onlyAdmin {
        entries[index].celebrated = true;
    }

    function sealFestival(uint256 index) external onlyAdmin {
        require(entries[index].celebrated, "Must be celebrated first");
        entries[index].sealed = true;
    }

    function getFestivalEntry(uint256 index) external view returns (FestivalEntry memory) {
        return entries[index];
    }
}
