pragma mythic;

contract ScrollchainPeaceMint {
    struct PeaceScroll {
        string country;
        string mintedBy;
        string reconciliationClause;
        string unlockMessage;
        bool systemsUnlocked;
        uint256 timestamp;
    }

    mapping(string => PeaceScroll) public peaceScrolls;

    event PeaceScrollMinted(string country, string mintedBy);
    event SystemsUnlocked(string country);

    function mintPeaceScroll(
        string memory _country,
        string memory _mintedBy,
        string memory _clause,
        string memory _message
    ) public {
        require(bytes(peaceScrolls[_country].country).length == 0, "Scroll already minted");

        peaceScrolls[_country] = PeaceScroll(
            _country,
            _mintedBy,
            _clause,
            _message,
            true,
            block.timestamp
        );

        emit PeaceScrollMinted(_country, _mintedBy);
        emit SystemsUnlocked(_country);
    }

    function getPeaceScroll(string memory _country) public view returns (
        string memory, string memory, string memory, string memory, bool, uint256
    ) {
        PeaceScroll memory scroll = peaceScrolls[_country];
        return (
            scroll.country,
            scroll.mintedBy,
            scroll.reconciliationClause,
            scroll.unlockMessage,
            scroll.systemsUnlocked,
            scroll.timestamp
        );
    }
}
