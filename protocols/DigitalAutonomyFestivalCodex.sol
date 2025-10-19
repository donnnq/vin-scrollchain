// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalAutonomyFestivalCodex {
    address public admin;

    struct FestivalEntry {
        string eventName;
        string techFocus;
        string autonomyTheme;
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

    function summonFestival(string memory eventName, string memory techFocus, string memory autonomyTheme, string memory emotionalTag) external onlyAdmin {
        entries.push(FestivalEntry(eventName, techFocus, autonomyTheme, emotionalTag, true, false, false));
    }

    function confirmCelebration(uint256 index) external onlyAdmin {
        entries[index].celebrated = true;
    }

    function sealFestivalEntry(uint256 index) external onlyAdmin {
        require(entries[index].celebrated, "Must be celebrated first");
        entries[index].sealed = true;
    }

    function getFestivalEntry(uint256 index) external view returns (FestivalEntry memory) {
        return entries[index];
    }
}
