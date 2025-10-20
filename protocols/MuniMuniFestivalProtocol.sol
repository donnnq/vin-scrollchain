// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MuniMuniFestivalProtocol {
    address public admin;

    struct FestivalEntry {
        string eventName;
        string muniTheme;
        string comfortClause;
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

    function summonFestival(string memory eventName, string memory muniTheme, string memory comfortClause, string memory emotionalTag) external onlyAdmin {
        entries.push(FestivalEntry(eventName, muniTheme, comfortClause, emotionalTag, true, false, false));
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
