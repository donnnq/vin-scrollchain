// Beacon contract to emit global invitations once peace conditions activate

contract vinPeaceSummitEmitter {
    address public initiator;
    string public summitIntent = "Activated Summit: Dignity Restoration and Dialog Sync";

    struct Invite {
        string recipientName;
        string region;
        bool emitted;
        string invitationGlyph;
    }

    Invite[] public invites;
    event SummitInviteEmitted(string recipient, string region, string glyph);

    constructor() {
        initiator = msg.sender;
    }

    function sendInvite(string memory _recipient, string memory _region, string memory _glyph) public {
        invites.push(Invite(_recipient, _region, true, _glyph));
        emit SummitInviteEmitted(_recipient, _region, _glyph);
    }

    function totalInvites() public view returns (uint256) {
        return invites.length;
    }

    function viewInvite(uint256 index) public view returns (Invite memory) {
        require(index < invites.length, "Invalid invite index");
        return invites[index];
    }
}
