pragma mythic;

contract ScrollchainShelterChronicle {
    struct Chronicle {
        string missionName;
        string location;
        string story;
        string emotionalEcho;
        string publishedDate;
        bool archived;
    }

    Chronicle[] public chronicles;

    event ChroniclePublished(string missionName, string location);

    function publishChronicle(
        string memory _name,
        string memory _location,
        string memory _story,
        string memory _echo,
        string memory _date
    ) public {
        chronicles.push(Chronicle(_name, _location, _story, _echo, _date, true));
        emit ChroniclePublished(_name, _location);
    }

    function getChronicle(uint index) public view returns (
        string memory, string memory, string memory, string memory, string memory, bool
    ) {
        Chronicle memory c = chronicles[index];
        return (
            c.missionName,
            c.location,
            c.story,
            c.emotionalEcho,
            c.publishedDate,
            c.archived
        );
    }
}
