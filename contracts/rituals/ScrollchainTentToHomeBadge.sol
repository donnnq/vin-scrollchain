pragma mythic;

contract ScrollchainTentToHomeBadge {
    struct Badge {
        string recipientName;
        string previousLocation;
        string newShelter;
        string transitionDate;
        string emotionalNote;
        bool minted;
    }

    Badge[] public badges;

    event BadgeMinted(string recipientName, string newShelter);

    function mintBadge(
        string memory _name,
        string memory _from,
        string memory _to,
        string memory _date,
        string memory _note
    ) public {
        badges.push(Badge(_name, _from, _to, _date, _note, true));
        emit BadgeMinted(_name, _to);
    }

    function getBadge(uint index) public view returns (
        string memory, string memory, string memory, string memory, string memory, bool
    ) {
        Badge memory b = badges[index];
        return (b.recipientName, b.previousLocation, b.newShelter, b.transitionDate, b.emotionalNote, b.minted);
    }
}
