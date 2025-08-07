pragma solidity ^0.8.0;

contract vinEmploymentEquityDAO {
    address public steward;
    uint256 public minVotes = 10;

    struct Agency {
        string name;
        address wallet;
        uint256 totalVotes;
        uint256 caringScore;
        bool verified;
    }

    mapping(address => Agency) public agencies;
    mapping(address => mapping(address => bool)) public hasVoted;

    event AgencyRated(address indexed rater, address indexed agency, uint256 score);
    event AgencyVerified(address indexed agency, uint256 caringScore);

    constructor() {
        steward = msg.sender;
    }

    function addAgency(address _agency, string memory _name) public {
        require(msg.sender == steward, "Only steward");
        agencies[_agency] = Agency(_name, _agency, 0, 0, false);
    }

    function rateAgency(address _agency, uint256 score) public {
        require(score >= 1 && score <= 5, "Score must be 1–5");
        require(!hasVoted[msg.sender][_agency], "Already voted");

        agencies[_agency].totalVotes += 1;
        agencies[_agency].caringScore += score;
        hasVoted[msg.sender][_agency] = true;

        emit AgencyRated(msg.sender, _agency, score);

        if (agencies[_agency].totalVotes >= minVotes) {
            agencies[_agency].verified = true;
            emit AgencyVerified(_agency, agencies[_agency].caringScore);
        }
    }

    function viewAgency(address _agency) public view returns (Agency memory) {
        return agencies[_agency];
    }
}
