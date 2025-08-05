pragma solidity ^0.8.0;

contract vinScrollReadyApplicantFestival {
    address public steward;

    struct Ceremony {
        address applicant;
        string name;
        string agency;
        string badgeTitle;
        uint256 ceremonyTime;
        bool completed;
    }

    mapping(address => Ceremony) public scrolls;

    event ScrollCeremonyCompleted(address indexed applicant, string badgeTitle, string agency);

    constructor() {
        steward = msg.sender;
    }

    function completeCeremony(
        address _applicant,
        string memory _name,
        string memory _agency,
        string memory _badgeTitle
    ) public {
        require(msg.sender == steward, "Only steward");

        scrolls[_applicant] = Ceremony(
            _applicant, _name, _agency, _badgeTitle, block.timestamp, true
        );

        emit ScrollCeremonyCompleted(_applicant, _badgeTitle, _agency);
    }

    function viewCeremony(address _applicant) public view returns (Ceremony memory) {
        return scrolls[_applicant];
    }
}
