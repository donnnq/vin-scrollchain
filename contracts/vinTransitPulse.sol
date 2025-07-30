// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinTransitPulse {
    struct Corridor {
        string origin;
        string destination;
        bool isHighSpeed;
        uint passengerCapacity;
    }

    Corridor[] public corridors;

    function addCorridor(string memory orig, string memory dest, bool speed, uint cap) public {
        corridors.push(Corridor(orig, dest, speed, cap));
    }

    function getCorridor(uint index) public view returns (Corridor memory) {
        require(index < corridors.length, "Invalid index");
        return corridors[index];
    }
}
