// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayRecreationZoneDAO {
    address public admin;

    struct RecreationEntry {
        string barangayName;
        string zoneType; // e.g., "basketball court", "playground", "skate park"
        string location;
        string emotionalTag;
        bool summoned;
        bool built;
        bool sealed;
    }

    RecreationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonZone(string memory barangayName, string memory zoneType, string memory location, string memory emotionalTag) external onlyAdmin {
        entries.push(RecreationEntry(barangayName, zoneType, location, emotionalTag, true, false, false));
    }

    function confirmBuild(uint256 index) external onlyAdmin {
        entries[index].built = true;
    }

    function sealZoneEntry(uint256 index) external onlyAdmin {
        require(entries[index].built, "Must be built first");
        entries[index].sealed = true;
    }

    function getZoneEntry(uint256 index) external view returns (RecreationEntry memory) {
        return entries[index];
    }
}
