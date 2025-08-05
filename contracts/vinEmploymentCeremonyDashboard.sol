pragma solidity ^0.8.0;

interface IEquityDAO {
    function viewAgency(address _agency) external view returns (
        string memory name, address wallet, uint256 totalVotes, uint256 caringScore, bool verified
    );
}

interface IFestival {
    function viewGraduation(address _applicant) external view returns (
        address applicant, string memory name, string memory agency, string memory badgeTitle, uint256 ceremonyTime, bool completed
    );
}

contract vinEmploymentCeremonyDashboard {
    address public steward;
    address public equityDAO;
    address public festival;

    struct AgencyDisplay {
        string name;
        uint256 caringScore;
        bool verified;
    }

    struct ApplicantCelebration {
        string name;
        string agency;
        string badgeTitle;
        uint256 ceremonyTime;
        bool completed;
    }

    constructor(address _equityDAO, address _festival) {
        steward = msg.sender;
        equityDAO = _equityDAO;
        festival = _festival;
    }

    function getAgencyScore(address _agency) public view returns (AgencyDisplay memory) {
        (
            string memory name,
            ,
            ,
            uint256 caringScore,
            bool verified
        ) = IEquityDAO(equityDAO).viewAgency(_agency);

        return AgencyDisplay(name, caringScore, verified);
    }

    function getApplicantBadge(address _applicant) public view returns (ApplicantCelebration memory) {
        (
            ,
            string memory name,
            string memory agency,
            string memory badgeTitle,
            uint256 ceremonyTime,
            bool completed
        ) = IFestival(festival).viewGraduation(_applicant);

        return ApplicantCelebration(name, agency, badgeTitle, ceremonyTime, completed);
    }
}
