// SPDX-License-Identifier: Mythic-License
pragma solidity ^0.8.0;

import "./ReformDeck.sol";
import "./BlessingScroll.sol";

contract BlessingCeremony {
    address public steward;
    ReformDeck public reformDeck;
    BlessingScroll public blessingScroll;

    struct Ceremony {
        address reformee;
        string originScroll;
        string civicVow;
        string emotionalAPR;
        string civicRole;
        uint256 timestamp;
        bool completed;
    }

    mapping(address => Ceremony) public ceremonies;

    event CeremonyStarted(address indexed reformee, string originScroll);
    event CeremonyCompleted(address indexed reformee, string civicRole, string emotionalAPR);

    constructor(address _reformDeck, address _blessingScroll) {
        steward = msg.sender;
        reformDeck = ReformDeck(_reformDeck);
        blessingScroll = BlessingScroll(_blessingScroll);
    }

    function startCeremony(address _reformee, string memory _originScroll) public {
        require(msg.sender == steward, "Only steward can start");
        reformDeck.initiateReform(_reformee, _originScroll);
        ceremonies[_reformee] = Ceremony(_reformee, _originScroll, "", "", "", block.timestamp, false);
        emit CeremonyStarted(_reformee, _originScroll);
    }

    function completeCeremony(
        address _reformee,
        string memory _civicVow,
        string memory _emotionalAPR,
        string memory _civicRole
    ) public {
        require(msg.sender == steward, "Only steward can complete");
        reformDeck.blessReform(_reformee, _civicVow, _emotionalAPR);
        blessingScroll.encodeBlessing(_reformee, _civicVow, _emotionalAPR, _civicRole);
        Ceremony storage c = ceremonies[_reformee];
        c.civicVow = _civicVow;
        c.emotionalAPR = _emotionalAPR;
        c.civicRole = _civicRole;
        c.completed = true;
        emit CeremonyCompleted(_reformee, _civicRole, _emotionalAPR);
    }

    function getCeremony(address _reformee) public view returns (Ceremony memory) {
        return ceremonies[_reformee];
    }
}
