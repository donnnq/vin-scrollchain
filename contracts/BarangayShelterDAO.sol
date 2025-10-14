// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayShelterDAO {
    address public admin;

    struct ShelterUnit {
        string barangay;
        string unitID;
        string status;
        string emotionalTag;
        bool occupied;
        bool freeHousingGranted;
    }

    ShelterUnit[] public shelters;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerUnit(string memory _barangay, string memory _unitID, string memory _status, string memory _emotionalTag) external onlyAdmin {
        shelters.push(ShelterUnit(_barangay, _unitID, _status, _emotionalTag, false, false));
    }

    function markOccupied(uint256 index) external onlyAdmin {
        shelters[index].occupied = true;
    }

    function grantFreeHousing(uint256 index) external onlyAdmin {
        shelters[index].freeHousingGranted = true;
    }

    function getUnit(uint256 index) external view returns (ShelterUnit memory) {
        return shelters[index];
    }
}
