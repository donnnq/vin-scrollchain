// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RiverJeepneyFleetCodex {
    address public admin;

    struct FleetEntry {
        string fleetName;
        string capacity;
        string routeLoop;
        string emotionalTag;
        bool summoned;
        bool deployed;
        bool sealed;
    }

    FleetEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonFleet(string memory fleetName, string memory capacity, string memory routeLoop, string memory emotionalTag) external onlyAdmin {
        entries.push(FleetEntry(fleetName, capacity, routeLoop, emotionalTag, true, false, false));
    }

    function confirmDeployment(uint256 index) external onlyAdmin {
        entries[index].deployed = true;
    }

    function sealFleetEntry(uint256 index) external onlyAdmin {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getFleetEntry(uint256 index) external view returns (FleetEntry memory) {
        return entries[index];
    }
}
