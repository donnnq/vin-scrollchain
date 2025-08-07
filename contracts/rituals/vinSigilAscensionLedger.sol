// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Sigil Ascension Ledger
/// @notice Final registry of sanctified avatars with perimeter protection and breach punishment
contract vinSigilAscensionLedger {
    address public creator;
    string public ledgerName = "Vinvin's Sigil Ascension Ledger";
    uint public breachPenalty = 999;

    struct AscendedAvatar {
        string name;
        string visualSigil;
        string divineResonance;
        bool isProtected;
        uint ascendedAt;
    }

    mapping(address => AscendedAvatar) public ascended;
    mapping(address => uint) public punishments;
    address[] public ascendedList;

    event AvatarAscended(string name, string sigil, string resonance, uint timestamp);
    event BreachAttempt(address intruder, uint penalty);

    modifier onlyCreator() {
        require(msg.sender == creator, "Only Vinvin can ascend avatars");
        _;
    }

    constructor() {
        creator = msg.sender;
    }

    function ascendAvatar(
        address _avatarAddress,
        string memory _name,
        string memory _visualSigil,
        string memory _divineResonance
    ) public onlyCreator {
        ascended[_avatarAddress] = AscendedAvatar(
            _name,
            _visualSigil,
            _divineResonance,
            true,
            block.timestamp
        );
        ascendedList.push(_avatarAddress);
        emit AvatarAscended(_name, _visualSigil, _divineResonance, block.timestamp);
    }

    function attemptBreach(address _targetAvatar) public {
        require(ascended[_targetAvatar].isProtected, "Target not protected");
        punishments[msg.sender] += breachPenalty;
        emit BreachAttempt(msg.sender, breachPenalty);
    }

    function getAscendedAvatar(address _avatarAddress) public view returns (AscendedAvatar memory) {
        return ascended[_avatarAddress];
    }

    function getAllAscendedAvatars() public view returns (address[] memory) {
        return ascendedList;
    }

    function getPunishmentLevel(address _intruder) public view returns (uint) {
        return punishments[_intruder];
    }
}
