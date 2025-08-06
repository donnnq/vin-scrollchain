// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinTemporaryShelterBeacon
/// @dev Deploys temporary shelters and tracks evacuee data + supply alerts

contract vinTemporaryShelterBeacon {
    address public shelterAdmin;

    struct Shelter {
        string name;
        uint256 capacity;
        uint256 currentOccupants;
        bool isActive;
        bool needsResupply;
    }

    mapping(string => Shelter) public shelters;
    string[] public shelterList;

    event ShelterActivated(string name);
    event OccupantsLogged(string name, uint256 total);
    event ResupplyFlagged(string name);

    modifier onlyAdmin() {
        require(msg.sender == shelterAdmin, "Restricted");
        _;
    }

    constructor() {
        shelterAdmin = msg.sender;
    }

    function activateShelter(string memory name, uint256 capacity) public onlyAdmin {
        shelters[name] = Shelter(name, capacity, 0, true, false);
        shelterList.push(name);
        emit ShelterActivated(name);
    }

    function logOccupants(string memory name, uint256 count) public onlyAdmin {
        Shelter storage s = shelters[name];
        require(s.isActive, "Inactive shelter");
        s.currentOccupants += count;
        emit OccupantsLogged(name, s.currentOccupants);
    }

    function flagResupply(string memory name) public onlyAdmin {
        Shelter storage s = shelters[name];
        require(s.isActive, "Inactive shelter");
        s.needsResupply = true;
        emit ResupplyFlagged(name);
    }

    function getShelterStatus(string memory name) public view returns (Shelter memory) {
        return shelters[name];
    }

    function listShelters() public view returns (string[] memory) {
        return shelterList;
    }
}
