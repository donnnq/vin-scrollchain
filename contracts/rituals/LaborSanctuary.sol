// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract LaborSanctuary {
    address public scrollsmith;
    uint256 public stipendRate = 3000; // symbolic units per training cycle

    enum SkillCategory {
        Construction,
        Healthcare,
        Hospitality,
        Agriculture,
        Tech,
        Manufacturing,
        DomesticWork,
        Education
    }

    struct Trainee {
        string name;
        SkillCategory category;
        string barangay;
        bool active;
        bool certified;
        uint256 stipendClaimed;
    }

    mapping(address => Trainee) public trainees;
    address[] public allTrainees;

    event TraineeRegistered(address indexed trainee, string name, SkillCategory category, string barangay);
    event StipendClaimed(address indexed trainee, uint256 amount);
    event CertificationGranted(address indexed trainee);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    modifier onlyActive() {
        require(trainees[msg.sender].active, "Not an active trainee");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// Register a new trainee in any barangay, city, or district
    function registerTrainee(address trainee, string calldata name, SkillCategory category, string calldata barangay) external onlyScrollsmith {
        trainees[trainee] = Trainee(name, category, barangay, true, false, 0);
        allTrainees.push(trainee);
        emit TraineeRegistered(trainee, name, category, barangay);
    }

    /// Claim stipend during training
    function claimStipend() external onlyActive {
        trainees[msg.sender].stipendClaimed += stipendRate;
        emit StipendClaimed(msg.sender, stipendRate);
    }

    /// Grant certification to trainee
    function certify(address trainee) external onlyScrollsmith {
        require(trainees[trainee].active, "Not active");
        trainees[trainee].certified = true;
        emit CertificationGranted(trainee);
    }

    /// Update stipend rate
    function updateStipend(uint256 newRate) external onlyScrollsmith {
        stipendRate = newRate;
    }

    /// Get all trainees
    function getAllTrainees() external view returns (address[] memory) {
        return allTrainees;
    }
}
