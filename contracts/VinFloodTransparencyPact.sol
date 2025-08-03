// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./vinScrollkeeper.sol"; // Governance contract from your core directory
import "./vinScrollAuditHealer.sol"; // Audit contract for verification
import "./vinJusticeBalancerProtocol.sol"; // For enforcing accountability

contract VinFloodTransparencyPact {
    address public admin; // Lawmaker (you, Satoshi) or DPWH representative
    VinScrollkeeper public scrollkeeper; // Reference to your governance contract
    VinScrollAuditHealer public auditHealer; // Reference to your audit contract
    VinJusticeBalancerProtocol public justiceBalancer; // Reference for accountability
    uint256 public totalFunds; // Total funds allocated
    uint256 public constant MAX_FUND_LIMIT = 3_000_000_000 * 10**18; // ₱3B in wei (1 PHP = 1 token for simplicity)
    bool public isLocked; // Lock funds if issues detected

    struct FloodProject {
        uint256 id; // Unique project ID
        string description; // E.g., "Bicol River Floodwall"
        uint256 amount; // Funds allocated
        address contractor; // Contractor address
        bool isVerified; // Auditor verification
        bool isPaid; // Funds released
        string ipfsHash; // Project documentation on IPFS (like your Pinata upload)
    }

    mapping(uint256 => FloodProject) public projects; // Tracks projects
    uint256 public projectCount; // Number of projects
    mapping(address => bool) public auditors; // Authorized auditors (e.g., COA)
    address[] public contractors; // List of contractors

    event FundsDeposited(address indexed sender, uint256 amount);
    event ProjectAdded(uint256 indexed projectId, string description, uint256 amount, address contractor, string ipfsHash);
    event ProjectVerified(uint256 indexed projectId, address indexed auditor);
    event FundsReleased(uint256 indexed projectId, address indexed contractor, uint256 amount);
    event FundsLocked(uint256 totalFunds);
    event AuditTriggered(uint256 indexed projectId, string reason);

    modifier onlyAdmin() {
        require(msg.sender == admin || scrollkeeper.isAuthorized(msg.sender), "Only admin or Scrollkeeper authorized");
        _;
    }

    modifier onlyAuditor() {
        require(auditors[msg.sender], "Only auditors can verify");
        _;
    }

    modifier notLocked() {
        require(!isLocked, "Funds are locked");
        _;
    }

    constructor(address _scrollkeeper, address _auditHealer, address _justiceBalancer) {
        admin = msg.sender; // You, the lawmaker
        scrollkeeper = VinScrollkeeper(_scrollkeeper); // Link to your governance contract
        auditHealer = VinScrollAuditHealer(_auditHealer); // Link to your audit contract
        justiceBalancer = VinJusticeBalancerProtocol(_justiceBalancer); // Link to accountability
        isLocked = false;
    }

    // Deposit funds (e.g., ₱3B flood control allocation)
    function depositFunds() external payable onlyAdmin notLocked {
        require(totalFunds + msg.value <= MAX_FUND_LIMIT, "Exceeds ₱3B limit");
        totalFunds += msg.value;
        if (totalFunds >= MAX_FUND_LIMIT) {
            isLocked = true;
            emit FundsLocked(totalFunds);
        }
        emit FundsDeposited(msg.sender, msg.value);
    }

    // Add a flood control project with IPFS documentation
    function addProject(string memory _description, uint256 _amount, address _contractor, string memory _ipfsHash) external onlyAdmin notLocked {
        require(_amount <= totalFunds, "Insufficient funds");
        projectCount++;
        projects[projectCount] = FloodProject({
            id: projectCount,
            description: _description,
            amount: _amount,
            contractor: _contractor,
            isVerified: false,
            isPaid: false,
            ipfsHash: _ipfsHash // Links to project docs on Pinata/IPFS
        });
        contractors.push(_contractor);
        emit ProjectAdded(projectCount, _description, _amount, _contractor, _ipfsHash);
    }

    // Add an auditor (e.g., COA or your ScrollAuditHealer)
    function addAuditor(address _auditor) external onlyAdmin {
        auditors[_auditor] = true;
    }

    // Auditor verifies project milestone using AuditHealer
    function verifyProject(uint256 _projectId) external onlyAuditor {
        require(_projectId <= projectCount && _projectId > 0, "Invalid project ID");
        require(!projects[_projectId].isVerified, "Project already verified");
        auditHealer.recordAudit(_projectId, true, "Milestone verified"); // Integrate with your audit contract
        projects[_projectId].isVerified = true;
        emit ProjectVerified(_projectId, msg.sender);
    }

    // Release funds for verified project
    function releaseFunds(uint256 _projectId) external onlyAdmin notLocked {
        require(_projectId <= projectCount && _projectId > 0, "Invalid project ID");
        FloodProject storage project = projects[_projectId];
        require(project.isVerified, "Project not verified");
        require(!project.isPaid, "Funds already released");
        require(address(this).balance >= project.amount, "Insufficient balance");

        project.isPaid = true;
        payable(project.contractor).transfer(project.amount);
        totalFunds -= project.amount;
        justiceBalancer.logTransaction(_projectId, project.contractor, project.amount); // Log to JusticeBalancer
        emit FundsReleased(_projectId, project.contractor, project.amount);
    }

    // Trigger audit if corruption is suspected (e.g., ₱3B theft)
    function triggerAudit(uint256 _projectId, string memory _reason) external onlyAdmin {
        require(_projectId <= projectCount && _projectId > 0, "Invalid project ID");
        isLocked = true;
        auditHealer.recordAudit(_projectId, false, _reason); // Log issue in AuditHealer
        justiceBalancer.flagForInvestigation(_projectId, _reason); // Flag for JusticeBalancer
        emit AuditTriggered(_projectId, _reason);
    }

    // Recover funds if corruption is confirmed
    function recoverFunds() external onlyAdmin {
        require(isLocked, "Funds must be locked");
        payable(admin).transfer(address(this).balance);
        totalFunds = 0;
    }

    // Public view of contract balance
    function getContractBalance() external view returns (uint256) {
        return address(this).balance;
    }

    // Link project docs to IPFS (like your Pinata upload)
    function updateProjectDocs(uint256 _projectId, string memory _newIpfsHash) external onlyAdmin {
        require(_projectId <= projectCount && _projectId > 0, "Invalid project ID");
        projects[_projectId].ipfsHash = _newIpfsHash;
    }
}
