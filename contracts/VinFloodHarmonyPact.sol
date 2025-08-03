// SPDX-License-Identifier: Mythstream-Vault
pragma solidity ^0.8.30;

/// @title VinFloodHarmonyPact
/// @notice Unified pact for flood control transparency, audit tracking, and aura restoration
/// @author VINVIN

contract VinFloodHarmonyPact {
    address public admin;

    uint256 public totalFunds;
    uint256 public constant MAX_FUND_LIMIT = 3_000_000_000 * 10**18; // ₱3B cap in wei
    bool public isLocked;

    struct Project {
        uint256 id;
        string description;
        uint256 amount;
        address contractor;
        string ipfsHash;
        bool isVerified;
        bool isPaid;
        string statusNote;
    }

    mapping(uint256 => Project) public projects;
    uint256 public projectCount;

    mapping(address => bool) public auditors;
    mapping(address => uint256) public auraScore;
    mapping(address => bool) public falseAccusers;

    event FundsDeposited(address indexed sender, uint256 amount);
    event ProjectAdded(uint256 indexed id, string description, address contractor);
    event ProjectVerified(uint256 indexed id, address auditor, string note);
    event FundsReleased(uint256 indexed id, address contractor, uint256 amount);
    event FundsLocked(uint256 total);
    event AuditLogged(address indexed by, string category, string note);
    event AuraRestored(address indexed to, uint256 amount);
    event FalseAccusationLogged(address indexed accuser, string message);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    modifier onlyAuditor() {
        require(auditors[msg.sender], "Not auditor");
        _;
    }

    modifier notLocked() {
        require(!isLocked, "Funds locked");
        _;
    }

    constructor() {
        admin = msg.sender;
        isLocked = false;
    }

    function depositFunds() external payable onlyAdmin notLocked {
        require(totalFunds + msg.value <= MAX_FUND_LIMIT, "Over ₱3B limit");
        totalFunds += msg.value;
        if (totalFunds >= MAX_FUND_LIMIT) {
            isLocked = true;
            emit FundsLocked(totalFunds);
        }
        emit FundsDeposited(msg.sender, msg.value);
    }

    function addProject(string calldata desc, uint256 amount, address contractor, string calldata ipfs) external onlyAdmin notLocked {
        require(amount <= totalFunds, "Insufficient funds");
        projectCount++;
        projects[projectCount] = Project(projectCount, desc, amount, contractor, ipfs, false, false, "");
        emit ProjectAdded(projectCount, desc, contractor);
    }

    function addAuditor(address auditor) external onlyAdmin {
        auditors[auditor] = true;
    }

    function verifyProject(uint256 id, string calldata note) external onlyAuditor {
        require(id > 0 && id <= projectCount, "Invalid ID");
        require(!projects[id].isVerified, "Already verified");
        projects[id].isVerified = true;
        projects[id].statusNote = note;
        emit ProjectVerified(id, msg.sender, note);
        emit AuditLogged(msg.sender, "Verified", note);
    }

    function releaseFunds(uint256 id) external onlyAdmin notLocked {
        Project storage p = projects[id];
        require(p.isVerified && !p.isPaid && address(this).balance >= p.amount, "Invalid release");
        p.isPaid = true;
        payable(p.contractor).transfer(p.amount);
        totalFunds -= p.amount;
        emit FundsReleased(id, p.contractor, p.amount);
    }

    function triggerAudit(uint256 id, string calldata note, address accuser) external onlyAdmin {
        require(id > 0 && id <= projectCount, "Invalid ID");
        isLocked = true;
        projects[id].statusNote = note;
        falseAccusers[accuser] = true;
        emit AuditLogged(msg.sender, "Issue", note);
        emit FalseAccusationLogged(accuser, note);
    }

    function restoreAura(address target, uint256 amount) external onlyAdmin {
        auraScore[target] += amount;
        emit AuraRestored(target, amount);
    }

    function getContractBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function getAura(address entity) external view returns (uint256) {
        return auraScore[entity];
    }

    function updateProjectDocs(uint256 id, string calldata newIpfs) external onlyAdmin {
        require(id > 0 && id <= projectCount, "Invalid ID");
        projects[id].ipfsHash = newIpfs;
    }
}
