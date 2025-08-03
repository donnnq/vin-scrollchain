// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TransparentFloodFund {
    address public admin; // Government entity (e.g., DPWH or authorized lawmaker)
    uint256 public totalFunds; // Total funds allocated to the project
    uint256 public constant MAX_FUND_LIMIT = 3_000_000_000 * 10**18; // ₱3B in wei (assuming 1 PHP = 1 token for simplicity)
    bool public isLocked; // Lock funds if max limit is exceeded

    struct Milestone {
        string description; // E.g., "Completed floodwall in Bicol"
        uint256 amount; // Funds allocated for this milestone
        bool isVerified; // Verified by independent auditor
        bool isPaid; // Funds released to contractor
        address contractor; // Contractor receiving funds
    }

    mapping(uint256 => Milestone) public milestones; // Tracks milestones by ID
    uint256 public milestoneCount; // Number of milestones
    mapping(address => bool) public auditors; // Authorized auditors
    address[] public contractors; // List of contractors

    event FundsDeposited(address indexed sender, uint256 amount);
    event MilestoneAdded(uint256 indexed milestoneId, string description, uint256 amount, address contractor);
    event MilestoneVerified(uint256 indexed milestoneId, address indexed auditor);
    event FundsReleased(uint256 indexed milestoneId, address indexed contractor, uint256 amount);
    event FundsLocked(uint256 totalFunds);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can call this function");
        _;
    }

    modifier onlyAuditor() {
        require(auditors[msg.sender], "Only auditors can verify milestones");
        _;
    }

    modifier notLocked() {
        require(!isLocked, "Funds are locked due to exceeding limit");
        _;
    }

    constructor() {
        admin = msg.sender; // Deployer (you, the lawmaker) is the admin
        isLocked = false;
    }

    // Government deposits funds into the contract
    function depositFunds() external payable onlyAdmin notLocked {
        require(totalFunds + msg.value <= MAX_FUND_LIMIT, "Exceeds max fund limit");
        totalFunds += msg.value;
        if (totalFunds >= MAX_FUND_LIMIT) {
            isLocked = true;
            emit FundsLocked(totalFunds);
        }
        emit FundsDeposited(msg.sender, msg.value);
    }

    // Admin adds a milestone for a project
    function addMilestone(string memory _description, uint256 _amount, address _contractor) external onlyAdmin notLocked {
        require(_amount <= totalFunds, "Insufficient funds in contract");
        milestoneCount++;
        milestones[milestoneCount] = Milestone({
            description: _description,
            amount: _amount,
            isVerified: false,
            isPaid: false,
            contractor: _contractor
        });
        contractors.push(_contractor);
        emit MilestoneAdded(milestoneCount, _description, _amount, _contractor);
    }

    // Admin adds an auditor
    function addAuditor(address _auditor) external onlyAdmin {
        auditors[_auditor] = true;
    }

    // Auditor verifies a milestone
    function verifyMilestone(uint256 _milestoneId) external onlyAuditor {
        require(_milestoneId <= milestoneCount && _milestoneId > 0, "Invalid milestone ID");
        require(!milestones[_milestoneId].isVerified, "Milestone already verified");
        milestones[_milestoneId].isVerified = true;
        emit MilestoneVerified(_milestoneId, msg.sender);
    }

    // Admin releases funds for a verified milestone
    function releaseFunds(uint256 _milestoneId) external onlyAdmin notLocked {
        require(_milestoneId <= milestoneCount && _milestoneId > 0, "Invalid milestone ID");
        Milestone storage milestone = milestones[_milestoneId];
        require(milestone.isVerified, "Milestone not yet verified");
        require(!milestone.isPaid, "Funds already released");
        require(address(this).balance >= milestone.amount, "Insufficient contract balance");
        
        milestone.isPaid = true;
        payable(milestone.contractor).transfer(milestone.amount);
        totalFunds -= milestone.amount;
        emit FundsReleased(_milestoneId, milestone.contractor, milestone.amount);
    }

    // Public view of contract balance
    function getContractBalance() external view returns (uint256) {
        return address(this).balance;
    }

    // Emergency stop to lock funds (e.g., if corruption is detected)
    function lockFunds() external onlyAdmin {
        isLocked = true;
        emit FundsLocked(totalFunds);
    }

    // Admin can recover funds in case of emergency (with transparency)
    function recoverFunds() external onlyAdmin {
        require(isLocked, "Funds must be locked to recover");
        payable(admin).transfer(address(this).balance);
        totalFunds = 0;
    }
}
