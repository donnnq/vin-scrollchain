// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title BlessingRegistry - Civic-grade registry for blessed vehicle imports
/// @notice Logs approved vehicles, enforces quality policies, and protects buyers from substandard imports

contract BlessingRegistry {
    address public steward;
    uint8 public minDurabilityScore = 85;
    uint8 public minOriginReputation = 4;

    struct Vehicle {
        string vin; // Vehicle Identification Number
        string brand;
        string model;
        uint16 year;
        uint8 durabilityScore; // 0–100
        uint8 originReputation; // 1–5
        bool blessed;
        string blessingNote;
    }

    mapping(string => Vehicle) public registry;
    string[] public blessedVINs;

    event VehicleBlessed(string vin, string brand, string model);
    event VehicleRejected(string vin, string reason);
    event StewardUpdated(address newSteward);

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not steward");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    /// @notice Bless a vehicle if it meets civic-grade standards
    function blessVehicle(
        string memory vin,
        string memory brand,
        string memory model,
        uint16 year,
        uint8 durabilityScore,
        uint8 originReputation
    ) external onlySteward {
        require(bytes(vin).length > 0, "VIN required");
        require(durabilityScore >= minDurabilityScore, "Durability too low");
        require(originReputation >= minOriginReputation, "Origin reputation too low");

        Vehicle memory v = Vehicle({
            vin: vin,
            brand: brand,
            model: model,
            year: year,
            durabilityScore: durabilityScore,
            originReputation: originReputation,
            blessed: true,
            blessingNote: "This vehicle passed civic-grade import protocols."
        });

        registry[vin] = v;
        blessedVINs.push(vin);
        emit VehicleBlessed(vin, brand, model);
    }

    /// @notice Reject a vehicle manually
    function rejectVehicle(string memory vin, string memory reason) external onlySteward {
        emit VehicleRejected(vin, reason);
    }

    /// @notice View blessed vehicle details
    function getVehicle(string memory vin) external view returns (Vehicle memory) {
        return registry[vin];
    }

    /// @notice Transfer stewardship
    function transferStewardship(address newSteward) external onlySteward {
        steward = newSteward;
        emit StewardUpdated(newSteward);
    }

    /// @notice Get total blessed vehicles
    function totalBlessed() external view returns (uint256) {
        return blessedVINs.length;
    }
}
