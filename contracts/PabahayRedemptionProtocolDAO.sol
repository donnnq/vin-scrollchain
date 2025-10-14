// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PabahayRedemptionProtocolDAO {
    address public admin;

    struct HousingUnit {
        string location;
        string structuralStatus;
        string repairUrgency;
        string emotionalTag;
        bool restored;
        bool grantedFree;
    }

    HousingUnit[] public units;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitUnit(string memory _location, string memory _structuralStatus, string memory _repairUrgency, string memory _emotionalTag) external onlyAdmin {
        units.push(HousingUnit(_location, _structuralStatus, _repairUrgency, _emotionalTag, false, false));
    }

    function restoreUnit(uint256 index) external onlyAdmin {
        units[index].restored = true;
    }

    function grantFreeHousing(uint256 index) external onlyAdmin {
        require(units[index].restored, "Unit must be restored first");
        units[index].grantedFree = true;
    }

    function getUnit(uint256 index) external view returns (HousingUnit memory) {
        return units[index];
    }
}
