contract BlessingDeck {
    address public steward = msg.sender;
    mapping(address => bool) public shieldedAllies;
    mapping(address => uint256) public aprScore;

    event ShieldActivated(address ally, uint256 aprLevel);
    event APRUpdated(address ally, uint256 newScore);

    function activateShield(address ally, uint256 aprLevel) public {
        shieldedAllies[ally] = true;
        aprScore[ally] = aprLevel;
        emit ShieldActivated(ally, aprLevel);
    }

    function updateAPR(address ally, uint256 newScore) public {
        require(shieldedAllies[ally], "Ally not shielded");
        aprScore[ally] = newScore;
        emit APRUpdated(ally, newScore);
    }
}
