// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RiverTourismDAO {
    address public admin;

    struct TourismEntry {
        string vesselTheme;
        string routeSegment;
        string experienceClause;
        string emotionalTag;
        bool summoned;
        bool launched;
        bool sealed;
    }

    TourismEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTourism(string memory vesselTheme, string memory routeSegment, string memory experienceClause, string memory emotionalTag) external onlyAdmin {
        entries.push(TourismEntry(vesselTheme, routeSegment, experienceClause, emotionalTag, true, false, false));
    }

    function confirmLaunch(uint256 index) external onlyAdmin {
        entries[index].launched = true;
    }

    function sealTourismEntry(uint256 index) external onlyAdmin {
        require(entries[index].launched, "Must be launched first");
        entries[index].sealed = true;
    }

    function getTourismEntry(uint256 index) external view returns (TourismEntry memory) {
        return entries[index];
    }
}
