// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract ScrollchainWitnessRegistry {
    address public steward;

    struct WitnessProfile {
        string name;
        string role; // e.g., “Barangay Elder”, “AI Mentor”, “Civic Validator”
        string emotionalNote;
        uint256 ceremoniesAttended;
        bool active;
    }

    mapping(address => WitnessProfile) public witnesses;
    address[] public witnessList;

    event WitnessRegistered(address indexed witness, string name, string role);
    event WitnessUpdated(address indexed witness, string emotionalNote, uint256 ceremoniesAttended);
    event WitnessRetired(address indexed witness);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function registerWitness(address witness, string memory name, string memory role) public onlySteward {
        witnesses[witness] = WitnessProfile(name, role, "", 0, true);
        witnessList.push(witness);
        emit WitnessRegistered(witness, name, role);
    }

    function updateWitnessNote(address witness, string memory emotionalNote) public onlySteward {
        require(witnesses[witness].active, "Witness not active");
        witnesses[witness].emotionalNote = emotionalNote;
        witnesses[witness].ceremoniesAttended += 1;
        emit WitnessUpdated(witness, emotionalNote, witnesses[witness].ceremoniesAttended);
    }

    function retireWitness(address witness) public onlySteward {
        witnesses[witness].active = false;
        emit WitnessRetired(witness);
    }

    function getWitnessList() public view returns (address[] memory) {
        return witnessList;
    }

    function getWitnessProfile(address witness) public view returns (WitnessProfile memory) {
        return witnesses[witness];
    }
}
