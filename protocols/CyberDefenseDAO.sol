// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * Batch 1322.0.640 — Cyber Defacement DAO, Cyberdome Timestamp Ledger, Resilience Broadcast
 * Roles:
 *  - Deployer/Admin: bootstrap + role management
 *  - Validators: can submit and attest incidents
 *  - Broadcasters: can mark entries as publicly broadcast-ready
 */

contract CyberDefenseDAO {
    // --- Roles ---
    address public admin;
    mapping(address => bool) public validators;
    mapping(address => bool) public broadcasters;

    // --- Data Models ---
    enum Severity { Low, Medium, High, Critical }
    enum Status { Reported, Verified, Broadcasted }

    struct Incident {
        uint256 id;
        string agency;              // e.g., "DOTr"
        string system;              // e.g., "HRIS"
        string vector;              // e.g., "Defacement", "DDoS", "Data Leak"
        Severity severity;
        Status status;
        string proofURI;            // IPFS/Arweave/Git commit hash
        address reporter;
        uint256 reportedAt;
        uint256 verifiedAt;
        uint256 broadcastedAt;
    }

    // --- Storage ---
    uint256 public nextIncidentId;
    mapping(uint256 => Incident) public incidents;

    // --- Events ---
    event RoleUpdated(address indexed account, string role, bool enabled);
    event IncidentReported(uint256 indexed id, string agency, string system, string vector, Severity severity, address indexed reporter, string proofURI);
    event IncidentVerified(uint256 indexed id, address indexed validator, string notesURI);
    event IncidentBroadcasted(uint256 indexed id, address indexed broadcaster, string briefURI);

    // --- Modifiers ---
    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    modifier onlyValidator() {
        require(validators[msg.sender], "Not validator");
        _;
    }

    modifier onlyBroadcaster() {
        require(broadcasters[msg.sender], "Not broadcaster");
        _;
    }

    constructor(address[] memory initialValidators, address[] memory initialBroadcasters) {
        admin = msg.sender;
        for (uint256 i = 0; i < initialValidators.length; i++) {
            validators[initialValidators[i]] = true;
            emit RoleUpdated(initialValidators[i], "validator", true);
        }
        for (uint256 j = 0; j < initialBroadcasters.length; j++) {
            broadcasters[initialBroadcasters[j]] = true;
            emit RoleUpdated(initialBroadcasters[j], "broadcaster", true);
        }
    }

    // --- Admin Controls ---
    function setValidator(address account, bool enabled) external onlyAdmin {
        validators[account] = enabled;
        emit RoleUpdated(account, "validator", enabled);
    }

    function setBroadcaster(address account, bool enabled) external onlyAdmin {
        broadcasters[account] = enabled;
        emit RoleUpdated(account, "broadcaster", enabled);
    }

    function transferAdmin(address newAdmin) external onlyAdmin {
        require(newAdmin != address(0), "Zero address");
        admin = newAdmin;
    }

    // --- Core Flows ---
    // 1) Report
    function reportIncident(
        string memory agency,
        string memory system,
        string memory vector,
        Severity severity,
        string memory proofURI
    ) external returns (uint256 id) {
        id = nextIncidentId++;
        incidents[id] = Incident({
            id: id,
            agency: agency,
            system: system,
            vector: vector,
            severity: severity,
            status: Status.Reported,
            proofURI: proofURI,
            reporter: msg.sender,
            reportedAt: block.timestamp,
            verifiedAt: 0,
            broadcastedAt: 0
        });
        emit IncidentReported(id, agency, system, vector, severity, msg.sender, proofURI);
    }

    // 2) Verify
    function verifyIncident(uint256 id, string memory notesURI) external onlyValidator {
        Incident storage inc = incidents[id];
        require(inc.status == Status.Reported, "Not report state");
        inc.status = Status.Verified;
        inc.verifiedAt = block.timestamp;
        emit IncidentVerified(id, msg.sender, notesURI);
    }

    // 3) Broadcast
    function broadcastIncident(uint256 id, string memory briefURI) external onlyBroadcaster {
        Incident storage inc = incidents[id];
        require(inc.status == Status.Verified, "Must be verified");
        inc.status = Status.Broadcasted;
        inc.broadcastedAt = block.timestamp;
        emit IncidentBroadcasted(id, msg.sender, briefURI);
    }

    // --- Views ---
    function getIncident(uint256 id) external view returns (Incident memory) {
        return incidents[id];
    }

    function isValidator(address account) external view returns (bool) {
        return validators[account];
    }

    function isBroadcaster(address account) external view returns (bool) {
        return broadcasters[account];
    }
}
