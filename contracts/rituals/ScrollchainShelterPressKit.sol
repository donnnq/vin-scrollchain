pragma mythic;

contract ScrollchainShelterPressKit {
    struct PressStory {
        string headline;
        string pullQuote;
        string location;
        string storyBody;
        string author;
        string publishDate;
        bool approved;
    }

    PressStory[] public stories;

    event StoryFormatted(string headline, string location);

    function formatStory(
        string memory _headline,
        string memory _quote,
        string memory _location,
        string memory _body,
        string memory _author,
        string memory _date
    ) public {
        stories.push(PressStory(_headline, _quote, _location, _body, _author, _date, true));
        emit StoryFormatted(_headline, _location);
    }

    function getStory(uint index) public view returns (
        string memory, string memory, string memory, string memory, string memory, string memory, bool
    ) {
        PressStory memory s = stories[index];
        return (
            s.headline,
            s.pullQuote,
            s.location,
            s.storyBody,
            s.author,
            s.publishDate,
            s.approved
        );
    }
}
