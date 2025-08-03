contract vinScrollTreatyOfDignifiedResolution {
    struct Participant {
        string name;
        bool remorseAcknowledged;
        bool restorationCommitted;
    }

    mapping(address => Participant) public signatories;
    event GlyphSigned(string nation, string gesture, string location);

    function signTreaty(address _signer, string memory _name, string memory _gesture, string memory _location) public {
        signatories[_signer] = Participant(_name, true, true);
        emit GlyphSigned(_name, _gesture, _location);
    }

    function verifyPeaceEligibility() public view returns (bool) {
        uint256 count = 0;
        for (uint256 i = 0; i < 2; i++) {
            if (signatories[address(uint160(i))].remorseAcknowledged && signatories[address(uint160(i))].restorationCommitted) {
                count++;
            }
        }
        return count == 2; // Peace only activates if both sides are legit.
    }
}
