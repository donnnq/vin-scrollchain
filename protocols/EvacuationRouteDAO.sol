// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EvacuationRouteDAO {
    address public admin;

    struct RouteEntry {
        string barangay;
        string routeType; // "Flood Escape", "Fire Exit", "Storm Shelter Path"
        string clause;
        string emotionalTag;
        bool summoned;
        bool mapped;
        bool sealed;
    }

    RouteEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRoute(string memory barangay, string memory routeType, string memory clause, string memory emotionalTag) external onlyAdmin {
        entries.push(RouteEntry(barangay, routeType, clause, emotionalTag, true, false, false));
    }

    function confirmMapping(uint256 index) external onlyAdmin {
        entries[index].mapped = true;
    }

    function sealRouteEntry(uint256 index) external onlyAdmin {
        require(entries[index].mapped, "Must be mapped first");
        entries[index].sealed = true;
    }

    function getRouteEntry(uint256 index) external view returns (RouteEntry memory) {
        return entries[index];
    }
}
