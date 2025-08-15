// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title CivicWitnessDeck
/// @notice Allows trusted individuals to co-sign and bear witness to the scrollsmith's legitimacy
contract CivicWitnessDeck {
    struct Witness {
        string name;
        string role;
        string testimony;
        uint256 timestamp;
    }

    Witness[] public witnesses;

    event WitnessAdded(string name, string role, string testimony);

    function addWitness(
        string memory _name,
        string memory _role,
        string memory _testimony
    ) public {
        witnesses.push(Witness({
            name: _name,
            role: _role,
            testimony: _testimony,
            timestamp: block.timestamp
        }));

        emit WitnessAdded(_name, _role, _testimony);
    }

    function getWitness(uint256 index) public view returns (Witness memory) {
        require(index < witnesses.length, "Invalid index");
        return witnesses[index];
    }

    function totalWitnesses() public view returns (uint256) {
        return witnesses.length;
    }
}
