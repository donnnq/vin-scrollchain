// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalNatureRootedTourismProtocol {
    address public admin;

    struct TourismEntry {
        string city;
        string tourismType; // "Forest Walk", "Riverfront Meditation", "Eco-Cultural Showcase"
        string protocolClause;
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

    function summonTourism(string memory city, string memory tourismType, string memory protocolClause, string memory emotionalTag) external onlyAdmin {
        entries.push(TourismEntry(city, tourismType, protocolClause, emotionalTag, true, false, false));
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
