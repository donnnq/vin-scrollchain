// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CollegeReclaim {
    address public scrollsmith;
    uint256 public monthlyAllowance = 3000 ether; // symbolic units
    uint256 public dormCapacity = 10000;

    struct Scholar {
        string name;
        string school;
        bool isPublic;
        bool active;
        bool hasDorm;
        uint256 allowanceClaimed;
    }

    mapping(address => Scholar) public scholars;
    address[] public allScholars;

    event ScholarRegistered(address indexed scholar, string school, bool isPublic);
    event DormAssigned(address indexed scholar);
    event AllowanceClaimed(address indexed scholar, uint256 amount);
    event ServiceUpgradeRequested(string school);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not scrollsmith");
        _;
    }

    modifier onlyScholar() {
        require(scholars[msg.sender].active, "Not an active scholar");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Register a scholar who paused college but wants to resume
    function registerScholar(address scholar, string calldata name, string calldata school, bool isPublic) external onlyScrollsmith {
        scholars[scholar] = Scholar(name, school, isPublic, true, false, 0);
        allScholars.push(scholar);
        emit ScholarRegistered(scholar, school, isPublic);
    }

    /// @notice Assign free dorm to scholar
    function assignDorm(address scholar) external onlyScrollsmith {
        require(scholars[scholar].active, "Scholar not active");
        require(!scholars[scholar].hasDorm, "Already has dorm");
        require(dormCapacity > 0, "No dorms left");
        scholars[scholar].hasDorm = true;
        dormCapacity--;
        emit DormAssigned(scholar);
    }

    /// @notice Scholar claims monthly allowance
    function claimAllowance() external onlyScholar {
        scholars[msg.sender].allowanceClaimed += monthlyAllowance;
        emit AllowanceClaimed(msg.sender, monthlyAllowance);
    }

    /// @notice Request service upgrade for public schools
    function requestUpgrade(string calldata school) external onlyScholar {
        require(scholars[msg.sender].isPublic, "Only public school scholars can request");
        emit ServiceUpgradeRequested(school);
    }

    /// @notice Update monthly allowance
    function setMonthlyAllowance(uint256 newAmount) external onlyScrollsmith {
        monthlyAllowance = newAmount;
    }

    /// @notice View all scholars
    function getAllScholars() external view returns (address[] memory) {
        return allScholars;
    }
}
