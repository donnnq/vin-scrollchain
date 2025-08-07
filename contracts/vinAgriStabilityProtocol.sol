// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinAgriStabilityProtocol
/// @dev Tracks food production and stability across fish ponds, meat farms, and vegetable gardens

contract vinAgriStabilityProtocol {
    enum FarmType { FishPond, MeatFarm, VegetableGarden }

    struct FarmRecord {
        address owner;
        FarmType farmType;
        string location;
        uint256 foodOutputKg;
        uint256 stabilityScore;
        uint256 lastUpdated;
    }

    FarmRecord[] public records;
    mapping(address => uint256[]) public ownerToRecords;

    event FarmLogged(
        address indexed owner,
        FarmType farmType,
        string location,
        uint256 foodOutputKg,
        uint256 stabilityScore,
        uint256 timestamp
    );

    /// @notice Log a new farm record
    /// @param farmType Type of farm (FishPond, MeatFarm, VegetableGarden)
    /// @param location Barangay or region
    /// @param foodOutputKg Total food produced in kilograms
    /// @param stabilityScore Score from 0–100 based on sustainability
    function logFarm(
        FarmType farmType,
        string memory location,
        uint256 foodOutputKg,
        uint256 stabilityScore
    ) public {
        require(stabilityScore <= 100, "Max score is 100");

        FarmRecord memory record = FarmRecord({
            owner: msg.sender,
            farmType: farmType,
            location: location,
            foodOutputKg: foodOutputKg,
            stabilityScore: stabilityScore,
            lastUpdated: block.timestamp
        });

        records.push(record);
        ownerToRecords[msg.sender].push(records.length - 1);

        emit FarmLogged(msg.sender, farmType, location, foodOutputKg, stabilityScore, block.timestamp);
    }

    /// @notice Get all farm records of the sender
    function getMyFarms() public view returns (FarmRecord[] memory) {
        uint256[] memory indexes = ownerToRecords[msg.sender];
        FarmRecord[] memory result = new FarmRecord[](indexes.length);

        for (uint256 i = 0; i < indexes.length; i++) {
            result[i] = records[indexes[i]];
        }

        return result;
    }

    /// @notice Get total food output of a contributor
    function getTotalOutput(address owner) public view returns (uint256 totalKg) {
        uint256[] memory indexes = ownerToRecords[owner];
        for (uint256 i = 0; i < indexes.length; i++) {
            totalKg += records[indexes[i]].foodOutputKg;
        }
    }
}
