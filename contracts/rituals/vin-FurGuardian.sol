// SPDX-License-Identifier: FURCARE
pragma solidity ^0.8.25;

/// @title vin-FurGuardian.sol
/// @notice Protects abandoned animals through verified care events and resource allocation.
contract FurGuardian {

    address public animalOracle;
    uint256 public rescueCount;
    uint256 public foodDistributed;

    struct CreatureCare {
        address caregiver;
        string species;
        uint256 foodTokens;
        bool shelterProvided;
        string affectionateAct;
    }

    mapping(uint256 => CreatureCare) public careLog;

    modifier onlyOracle() {
        require(msg.sender == animalOracle, "Only the Fur Oracle may validate compassion.");
        _;
    }

    constructor() {
        animalOracle = msg.sender;
    }

    /// @notice Log a rescue or act of care
    function logCare(
        address caregiver,
        string memory species,
        uint256 tokens,
        bool shelter,
        string memory affection
    ) public onlyOracle {
        careLog[rescueCount] = CreatureCare(caregiver, species, tokens, shelter, affection);
        rescueCount++;
        foodDistributed += tokens;
    }

    /// @notice Returns stats for community animal support
    function guardianStats() public view returns (uint256 rescues, uint256 foodTokens) {
        return (rescueCount, foodDistributed);
    }
}
