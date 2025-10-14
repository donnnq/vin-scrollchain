// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmergencyShelterEquityDAO {
    address public admin;

    struct Shelter {
        string location;
        uint256 capacity;
        bool accessible;
        bool verified;
    }

    Shelter[] public shelters;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerShelter(string memory _location, uint256 _capacity, bool _accessible) external onlyAdmin {
        shelters.push(Shelter(_location, _capacity, _accessible, true));
    }

    function getShelter(uint256 index) external view returns (Shelter memory) {
        return shelters[index];
    }
}
