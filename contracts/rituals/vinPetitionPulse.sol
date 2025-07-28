contract vinPetitionPulse {
    struct Petition {
        string description;
        uint256 supportCount;
        bool escalated;
    }

    Petition[] public petitions;
    mapping(uint256 => mapping(address => bool)) public hasSigned;

    event PetitionSigned(uint256 indexed petitionId, address signer);
    event PetitionEscalated(uint256 indexed petitionId);

    function createPetition(string memory description) public {
        petitions.push(Petition(description, 0, false));
    }

    function sign(uint256 petitionId) public {
        require(!hasSigned[petitionId][msg.sender], "Already signed");
        hasSigned[petitionId][msg.sender] = true;
        petitions[petitionId].supportCount++;

        emit PetitionSigned(petitionId, msg.sender);

        if (petitions[petitionId].supportCount >= 100 && !petitions[petitionId].escalated) {
            petitions[petitionId].escalated = true;
            emit PetitionEscalated(petitionId);
        }
    }
}
