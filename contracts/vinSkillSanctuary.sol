// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinSkillSanctuary {
    address public scrollsmith;
    uint public traineeCount;

    struct Trainee {
        string name;
        string skillPath;
        bool stipendGranted;
        uint enrollmentDate;
        string dreamJob;
    }

    mapping(uint => Trainee) public scrollTrainees;

    event TraineeEnrolled(string name, string skillPath, string dreamJob);
    event StipendMinted(string name, uint amount);
    event ScrollsmithTransferred(address oldScrollsmith, address newScrollsmith);

    constructor() {
        scrollsmith = msg.sender;
        traineeCount = 0;
    }

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Only scrollsmith may mint stipends.");
        _;
    }

    // Enroll a trainee into the scroll program
    function enrollTrainee(
        string memory name,
        string memory skillPath,
        string memory dreamJob
    ) public onlyScrollsmith {
        scrollTrainees[traineeCount++] = Trainee(name, skillPath, false, block.timestamp, dreamJob);
        emit TraineeEnrolled(name, skillPath, dreamJob);
    }

    // Grant stipend to trainee during training
    function mintStipend(uint traineeId, uint amount) public onlyScrollsmith {
        require(traineeId < traineeCount, "Invalid trainee ID.");
        scrollTrainees[traineeId].stipendGranted = true;
        emit StipendMinted(scrollTrainees[traineeId].name, amount);
    }

    // View a trainee’s journey
    function getTrainee(uint id) public view returns (
        string memory name,
        string memory skillPath,
        bool stipendGranted,
        uint enrollmentDate,
        string memory dreamJob
    ) {
        Trainee memory t = scrollTrainees[id];
        return (t.name, t.skillPath, t.stipendGranted, t.enrollmentDate, t.dreamJob);
    }

    // Transfer scrollsmith rights
    function transferScrollsmith(address newScrollsmith) public onlyScrollsmith {
        require(newScrollsmith != address(0), "Invalid address.");
        emit ScrollsmithTransferred(scrollsmith, newScrollsmith);
        scrollsmith = newScrollsmith;
    }

    // View total trainees
    function totalTrainees() public view returns (uint) {
        return traineeCount;
    }
}
