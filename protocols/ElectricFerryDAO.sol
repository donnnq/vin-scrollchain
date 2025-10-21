// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ElectricFerryDAO {
    address public admin;

    struct FerryEntry {
        string vesselName;
        string routeSegment;
        string energySource;
        string emotionalTag;
        bool summoned;
        bool deployed;
        bool sealed;
    }

    FerryEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonFerry(string memory vesselName, string memory routeSegment, string memory energySource, string memory emotionalTag) external onlyAdmin {
        entries.push(FerryEntry(vesselName, routeSegment, energySource, emotionalTag, true, false, false));
    }

    function confirmDeployment(uint256 index) external onlyAdmin {
        entries[index].deployed = true;
    }

    function sealFerryEntry(uint256 index) external onlyAdmin {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getFerryEntry(uint256 index) external view returns (FerryEntry memory) {
        return entries[index];
    }
}
