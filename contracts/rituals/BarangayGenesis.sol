// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title BarangayGenesis - Ritual scroll for deploying public infrastructure per barangay or city
/// @author Vinvin
/// @notice Encodes hospitals, crypto banks, mini malls, HQs, and emergency services per region

contract BarangayGenesis {
    address public scrollsmith;

    struct Infrastructure {
        bool hospital;
        bool policeStation;
        bool miniMall;
        bool veggieMarket;
        bool miniGym;
        bool cryptoBank;
        bool ambulance;
        bool firetruck;
        bool workHQ;
    }

    mapping(string => Infrastructure) public barangayInfra;
    mapping(string => bool) public isDeployed;

    event InfrastructureDeployed(string indexed barangay);
    event InfraUpdated(string indexed barangay, string service, bool status);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not scrollsmith");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Deploy full infrastructure set to a barangay or city
    function deployInfra(string memory barangay) external onlyScrollsmith {
        require(!isDeployed[barangay], "Already deployed");
        barangayInfra[barangay] = Infrastructure({
            hospital: true,
            policeStation: true,
            miniMall: true,
            veggieMarket: true,
            miniGym: true,
            cryptoBank: true,
            ambulance: true,
            firetruck: true,
            workHQ: true
        });
        isDeployed[barangay] = true;
        emit InfrastructureDeployed(barangay);
    }

    /// @notice Update specific service status
    function updateService(string memory barangay, string memory service, bool status) external onlyScrollsmith {
        Infrastructure storage infra = barangayInfra[barangay];

        if (keccak256(bytes(service)) == keccak256("hospital")) infra.hospital = status;
        else if (keccak256(bytes(service)) == keccak256("police")) infra.policeStation = status;
        else if (keccak256(bytes(service)) == keccak256("mall")) infra.miniMall = status;
        else if (keccak256(bytes(service)) == keccak256("veggie")) infra.veggieMarket = status;
        else if (keccak256(bytes(service)) == keccak256("gym")) infra.miniGym = status;
        else if (keccak256(bytes(service)) == keccak256("bank")) infra.cryptoBank = status;
        else if (keccak256(bytes(service)) == keccak256("ambulance")) infra.ambulance = status;
        else if (keccak256(bytes(service)) == keccak256("firetruck")) infra.firetruck = status;
        else if (keccak256(bytes(service)) == keccak256("hq")) infra.workHQ = status;

        emit InfraUpdated(barangay, service, status);
    }

    /// @notice View full infrastructure status
    function getInfra(string memory barangay) external view returns (Infrastructure memory) {
        return barangayInfra[barangay];
    }
}
