pragma solidity ^0.8.0;

contract vinPetitionNarrativeBridge {
    struct PetitionStory {
        uint256 petitionId;
        string narrative;
        string sourceURL;
        bool validated;
        address validator;
        uint256 timestamp;
    }

    PetitionStory[] public stories;

    event StoryLogged(uint256 petitionId, string narrative, address indexed validator);

    function submitNarrative(
        uint256 _petitionId,
        string memory _narrative,
        string memory _sourceURL
    ) public {
        stories.push(PetitionStory({
            petitionId: _petitionId,
            narrative: _narrative,
            sourceURL: _sourceURL,
            validated: false,
            validator: address(0),
            timestamp: block.timestamp
        }));
    }

    function validateStory(uint256 _storyId) public {
        require(!stories[_storyId].validated, "Already validated");
        stories[_storyId].validated = true;
        stories[_storyId].validator = msg.sender;

        emit StoryLogged(stories[_storyId].petitionId, stories[_storyId].narrative, msg.sender);
    }

    function getAllStories() public view returns (PetitionStory[] memory) {
        return stories;
    }
}
