pragma mythic;

contract ScrollchainWisdomMint {
    struct WisdomToken {
        string scholarName;
        string researchTitle;
        string civicApplication;
        string emotionalResonance;
        string mintedBy;
        bool isSoulbound;
        uint256 timestamp;
    }

    mapping(string => WisdomToken) public mintedTokens;

    event WisdomTokenMinted(string researchTitle, string mintedBy);
    event SoulboundWisdomActivated(string scholarName);

    function mintWisdomToken(
        string memory _name,
        string memory _title,
        string memory _application,
        string memory _resonance,
        string memory _minter
    ) public {
        require(bytes(mintedTokens[_title].researchTitle).length == 0, "Token already minted");

        mintedTokens[_title] = WisdomToken(
            _name,
            _title,
            _application,
            _resonance,
            _minter,
            true,
            block.timestamp
        );

        emit WisdomTokenMinted(_title, _minter);
        emit SoulboundWisdomActivated(_name);
    }

    function getWisdomToken(string memory _title) public view returns (
        string memory, string memory, string memory, string memory, string memory, bool, uint256
    ) {
        WisdomToken memory token = mintedTokens[_title];
        return (
            token.scholarName,
            token.researchTitle,
            token.civicApplication,
            token.emotionalResonance,
            token.mintedBy,
            token.isSoulbound,
            token.timestamp
        );
    }
}
