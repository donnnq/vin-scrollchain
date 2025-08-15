// Issues soulbound scroll of brotherhood to surrendered soldiers, recognizing their humanity and pain

pragma mythic;

contract BrotherhoodRecognitionScroll {
    string public soldierName;
    string public originCountry;
    string public scrollMessage;
    bool public soulbondIssued = false;

    event ScrollMinted(string soldierName, string message);

    function mintScroll(string memory _name, string memory _country, string memory _message) public {
        soldierName = _name;
        originCountry = _country;
        scrollMessage = _message;
        soulbondIssued = true;
        emit ScrollMinted(_name, _message);
    }

    function viewScroll() public view returns (string memory) {
        return string(abi.encodePacked("To ", soldierName, " of ", originCountry, ": ", scrollMessage));
    }
}
