// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RiverMobilityDAO {
    address public admin;

    struct VesselEntry {
        string vesselName;
        string segmentRoute;
        string fareProtocol;
        string emotionalTag;
        bool summoned;
        bool registered;
        bool sealed;
    }

    VesselEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonVessel(string memory vesselName, string memory segmentRoute, string memory fareProtocol, string memory emotionalTag) external onlyAdmin {
        entries.push(VesselEntry(vesselName, segmentRoute, fareProtocol, emotionalTag, true, false, false));
    }

    function confirmRegistration(uint256 index) external onlyAdmin {
        entries[index].registered = true;
    }

    function sealVesselEntry(uint256 index) external onlyAdmin {
        require(entries[index].registered, "Must be registered first");
        entries[index].sealed = true;
    }

    function getVesselEntry(uint256 index) external view returns (VesselEntry memory) {
        return entries[index];
    }
}
