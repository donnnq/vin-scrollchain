// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title WitnessBlessingProtocol
/// @notice Blesses verified witnesses with civic perks and emotional resonance
contract WitnessBlessingProtocol {
    struct Blessing {
        address witness;
        string message;
        uint256 timestamp;
    }

    Blessing[] public blessings;

    event WitnessBlessed(address witness, string message);

    function blessWitness(address _witness, string memory _message) public {
        blessings.push(Blessing({
            witness: _witness,
            message: _message,
            timestamp: block.timestamp
        }));

        emit WitnessBlessed(_witness, _message);
    }

    function getBlessing(uint256 index) public view returns (Blessing memory) {
        require(index < blessings.length, "Invalid index");
        return blessings[index];
    }

    function totalBlessings() public view returns (uint256) {
        return blessings.length;
    }
}
