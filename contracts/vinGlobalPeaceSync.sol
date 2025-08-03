// Scroll contract for synchronized peace dialogue across nations in conflict

contract vinGlobalPeaceSync {
    address public initiator;
    string public invocation = "Wakas. Sama-sama. Magsimula muli.";

    struct PeaceNode {
        string country;
        bool warParticipant;
        bool dialogAccepted;
        string messageGlyph;
    }

    mapping(string => PeaceNode) public participants;
    string[] public countryList;
    event PeaceSyncRequested(string country, string message);
    event PeaceDialogOpened(string country);

    constructor() {
        initiator = msg.sender;
    }

    function inviteCountry(string memory _country, bool _warParticipant, string memory _messageGlyph) public {
        participants[_country] = PeaceNode(_country, _warParticipant, false, _messageGlyph);
        countryList.push(_country);
        emit PeaceSyncRequested(_country, _messageGlyph);
    }

    function openDialog(string memory _country) public {
        require(participants[_country].warParticipant, "Not listed as war party.");
        participants[_country].dialogAccepted = true;
        emit PeaceDialogOpened(_country);
    }

    function viewParticipant(string memory _country) public view returns (PeaceNode memory) {
        return participants[_country];
    }

    function totalInvited() public view returns (uint256) {
        return countryList.length;
    }
}
