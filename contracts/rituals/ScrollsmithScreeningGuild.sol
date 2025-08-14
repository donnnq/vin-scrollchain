// SPDX-License-Identifier: Mythic-Scrollsmith
pragma solidity ^0.8.0;

/// @title Scrollsmith Screening Guild
/// @notice Ritual-grade contract for dignified applicant screening and onboarding
/// @author Vinvin

contract ScrollsmithScreeningGuild {
    struct Applicant {
        string name;
        string soulboundIntent;
        string civicAlignment;
        uint256 emotionalAPR;
        bool isLegendReady;
    }

    address public steward;
    mapping(address => Applicant) public applicants;
    address[] public applicantList;

    event ApplicantInterviewed(address indexed applicant, string name, bool isLegendReady);
    event EmotionalAPRUpdated(address indexed applicant, uint256 newAPR);
    event CivicAlignmentConfirmed(address indexed applicant, string alignment);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized scrollsmith");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function submitApplicant(
        address _applicant,
        string memory _name,
        string memory _soulboundIntent,
        string memory _civicAlignment
    ) public onlySteward {
        applicants[_applicant] = Applicant({
            name: _name,
            soulboundIntent: _soulboundIntent,
            civicAlignment: _civicAlignment,
            emotionalAPR: 0,
            isLegendReady: false
        });
        applicantList.push(_applicant);
        emit CivicAlignmentConfirmed(_applicant, _civicAlignment);
    }

    function conductInterview(address _applicant, uint256 _emotionalAPR) public onlySteward {
        require(bytes(applicants[_applicant].name).length > 0, "Applicant not found");
        applicants[_applicant].emotionalAPR = _emotionalAPR;
        applicants[_applicant].isLegendReady = _emotionalAPR >= 88;
        emit EmotionalAPRUpdated(_applicant, _emotionalAPR);
        emit ApplicantInterviewed(_applicant, applicants[_applicant].name, applicants[_applicant].isLegendReady);
    }

    function getApplicantStatus(address _applicant) public view returns (string memory status) {
        if (applicants[_applicant].isLegendReady) {
            return "Scrollbound: Ready for onboarding";
        } else {
            return "Still in mythic incubation";
        }
    }

    function getAllApplicants() public view returns (address[] memory) {
        return applicantList;
    }
}
