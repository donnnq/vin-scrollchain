// SPDX-License-Identifier: Mythic-Compassion
pragma solidity ^0.8.20;

contract OpenHiringScroll {
    address public steward;
    uint256 public applicantCount;

    struct Applicant {
        address wallet;
        string name;
        string desiredRole;
        bool accepted;
        bool needsGuidance;
    }

    mapping(uint256 => Applicant) public applicants;
    mapping(address => bool) public isAccepted;

    event ApplicantBlessed(address indexed applicant, string role);
    event GuidanceRequested(address indexed applicant);

    modifier onlySteward() {
        require(msg.sender == steward, "Only steward can guide");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    /// @notice Submit application (auto-accepted)
    function apply(string memory name, string memory desiredRole) external {
        require(!isAccepted[msg.sender], "Already accepted");

        applicants[applicantCount] = Applicant({
            wallet: msg.sender,
            name: name,
            desiredRole: desiredRole,
            accepted: true,
            needsGuidance: false
        });

        isAccepted[msg.sender] = true;
        emit ApplicantBlessed(msg.sender, desiredRole);
        applicantCount++;
    }

    /// @notice Supervisor flags applicant for guidance
    function requestGuidance(uint256 applicantId) external onlySteward {
        applicants[applicantId].needsGuidance = true;
        emit GuidanceRequested(applicants[applicantId].wallet);
    }

    /// @notice View applicant details
    function getApplicant(uint256 id) external view returns (Applicant memory) {
        return applicants[id];
    }
}
