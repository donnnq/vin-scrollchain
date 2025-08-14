// SPDX-License-Identifier: Mythic-Unity
pragma solidity ^0.8.20;

contract OneCommunityHiring {
    address public steward;
    uint256 public applicantCount;

    struct Applicant {
        address wallet;
        string name;
        string initialRole;
        string currentRole;
        bool accepted;
        bool needsGuidance;
        bool reassigned;
    }

    mapping(uint256 => Applicant) public applicants;
    mapping(address => bool) public isAccepted;

    event ApplicantWelcomed(address indexed applicant, string role);
    event GuidanceActivated(address indexed applicant);
    event RoleReassigned(address indexed applicant, string newRole);

    modifier onlySteward() {
        require(msg.sender == steward, "Only steward can guide or reassign");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    /// @notice Apply to join the community (auto-accepted if masipag)
    function apply(string memory name, string memory role, bool masipag, bool hindiAbsent) external {
        require(!isAccepted[msg.sender], "Already accepted");
        require(masipag && hindiAbsent, "Sipag at attendance required");

        applicants[applicantCount] = Applicant({
            wallet: msg.sender,
            name: name,
            initialRole: role,
            currentRole: role,
            accepted: true,
            needsGuidance: false,
            reassigned: false
        });

        isAccepted[msg.sender] = true;
        emit ApplicantWelcomed(msg.sender, role);
        applicantCount++;
    }

    /// @notice Steward flags applicant for guidance
    function activateGuidance(uint256 applicantId) external onlySteward {
        applicants[applicantId].needsGuidance = true;
        emit GuidanceActivated(applicants[applicantId].wallet);
    }

    /// @notice Reassign applicant to a better-fitting role
    function reassignRole(uint256 applicantId, string memory newRole) external onlySteward {
        applicants[applicantId].currentRole = newRole;
        applicants[applicantId].reassigned = true;
        emit RoleReassigned(applicants[applicantId].wallet, newRole);
    }

    /// @notice View applicant details
    function getApplicant(uint256 id) external view returns (Applicant memory) {
        return applicants[id];
    }
}
