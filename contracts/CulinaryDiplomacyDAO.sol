// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CulinaryDiplomacyDAO {
    address public admin;

    struct DiplomacyEntry {
        string dishName;
        string originRegion;
        string diplomacyClause;
        string emotionalTag;
        bool activated;
    }

    DiplomacyEntry[] public diplomacy;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _dishName, string memory _originRegion, string memory _diplomacyClause, string memory _emotionalTag) external onlyAdmin {
        diplomacy.push(DiplomacyEntry(_dishName, _originRegion, _diplomacyClause, _emotionalTag, false));
    }

    function activateEntry(uint256 index) external onlyAdmin {
        diplomacy[index].activated = true;
    }

    function getEntry(uint256 index) external view returns (DiplomacyEntry memory) {
        return diplomacy[index];
    }
}
