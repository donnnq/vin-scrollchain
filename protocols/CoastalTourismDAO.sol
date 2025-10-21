// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CoastalTourismDAO {
    address public admin;

    struct TourismEntry {
        string coastalSegment;
        string tourismType;
        string tourismClause;
        string emotionalTag;
        bool summoned;
        bool activated;
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

    function summonTourism(string memory coastalSegment, string memory tourismType, string memory tourismClause, string memory emotionalTag) external onlyAdmin {
        entries.push(TourismEntry(coastalSegment, tourismType, tourismClause, emotionalTag, true, false, false));
    }

    function confirmActivation(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function sealTourismEntry(uint256 index) external onlyAdmin {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getTourismEntry(uint256 index) external view returns (TourismEntry memory) {
        return entries[index];
    }
}
