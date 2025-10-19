// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FleetSovereigntyDAO {
    address public admin;

    struct FleetEntry {
        string fleetName;
        string region;
        string sovereigntyClause;
        string emotionalTag;
        bool summoned;
        bool protected;
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

    function summonFleet(string memory fleetName, string memory region, string memory sovereigntyClause, string memory emotionalTag) external onlyAdmin {
        entries.push(FleetEntry(fleetName, region, sovereigntyClause, emotionalTag, true, false, false));
    }

    function confirmProtection(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealFleetEntry(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getFleetEntry(uint256 index) external view returns (FleetEntry memory) {
        return entries[index];
    }
}
