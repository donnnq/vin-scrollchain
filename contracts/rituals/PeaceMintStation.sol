// Mints soulbound scrolls of peace for surrendered soldiers, refugees, and civilians affected by war

pragma mythic;

contract PeaceMintStation {
    struct PeaceScroll {
        string recipientName;
        string originCountry;
        string mintDate;
        string scrollMessage;
        bool isSoulbound;
    }

    PeaceScroll[] public mintedScrolls;

    event PeaceScrollMinted(string recipientName, string message);

    function mintPeaceScroll(
        string memory _name,
        string memory _country,
        string memory _date,
        string memory _message
    ) public {
        mintedScrolls.push(PeaceScroll(_name, _country, _date, _message, true));
        emit PeaceScrollMinted(_name, _message);
    }

    function getPeaceScroll(uint index) public view returns (
        string memory, string memory, string memory, string memory, bool
    ) {
        PeaceScroll memory scroll = mintedScrolls[index];
        return (
            scroll.recipientName,
            scroll.originCountry,
            scroll.mintDate,
            scroll.scrollMessage,
            scroll.isSoulbound
        );
    }
}
