pragma solidity ^0.8.0;

contract vinCitizenWatchdogDAO {
    struct AnomalyPetition {
        string projectName;
        string description;
        address submitter;
        uint256 upvotes;
        uint256 downvotes;
        bool resolved;
        uint256 timestamp;
    }

    AnomalyPetition[] public petitions;
    mapping(uint256 => mapping(address => bool)) public hasVoted;

    event PetitionSubmitted(string projectName, address indexed submitter, uint256 petitionId);
    event VoteCast(uint256 petitionId, bool support, address indexed voter);
    event PetitionResolved(uint256 petitionId, bool majoritySupport);

    function submitPetition(string memory _projectName, string memory _description) public {
        petitions.push(AnomalyPetition({
            projectName: _projectName,
            description: _description,
            submitter: msg.sender,
            upvotes: 0,
            downvotes: 0,
            resolved: false,
            timestamp: block.timestamp
        }));

        emit PetitionSubmitted(_projectName, msg.sender, petitions.length - 1);
    }

    function voteOnPetition(uint256 _petitionId, bool support) public {
        require(!petitions[_petitionId].resolved, "Petition already resolved");
        require(!hasVoted[_petitionId][msg.sender], "Already voted");

        hasVoted[_petitionId][msg.sender] = true;

        if (support) {
            petitions[_petitionId].upvotes += 1;
        } else {
            petitions[_petitionId].downvotes += 1;
        }

        emit VoteCast(_petitionId, support, msg.sender);
    }

    function resolvePetition(uint256 _petitionId) public {
        require(!petitions[_petitionId].resolved, "Already resolved");

        petitions[_petitionId].resolved = true;
        bool majoritySupport = petitions[_petitionId].upvotes > petitions[_petitionId].downvotes;

        emit PetitionResolved(_petitionId, majoritySupport);
    }

    function getAllPetitions() public view returns (AnomalyPetition[] memory) {
        return petitions;
    }
}
