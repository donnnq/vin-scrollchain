contract vinDealMakersPledge {
    struct Pact {
        address dealMaker;
        string purpose;
        uint256 declaredValue;
        bool oathSigned;
    }

    mapping(uint256 => Pact) public pacts;
    event OathLogged(uint256 indexed pactId, address indexed dealMaker, bool oathSigned);

    function declarePact(uint256 pactId, string memory purpose, uint256 value) public {
        pacts[pactId] = Pact(msg.sender, purpose, value, true);
        emit OathLogged(pactId, msg.sender, true);
    }
}
