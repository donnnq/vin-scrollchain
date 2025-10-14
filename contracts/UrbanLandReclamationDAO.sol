// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanLandReclamationDAO {
    address public admin;

    struct ReclaimedLand {
        string location;
        bool convertedToHousing;
        address planner;
    }

    ReclaimedLand[] public lands;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitLand(string memory _location, address _planner) external onlyAdmin {
        lands.push(ReclaimedLand(_location, false, _planner));
    }

    function convertToHousing(uint256 index) external onlyAdmin {
        lands[index].convertedToHousing = true;
    }

    function getLand(uint256 index) external view returns (ReclaimedLand memory) {
        return lands[index];
    }
}
