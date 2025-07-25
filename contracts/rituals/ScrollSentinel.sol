contract ScrollSentinelVault {
    address payable public guardian = payable(msg.sender);
    uint256 public dignityGrant = 0.118794 ether; // Matches BTC whisper price

    event RitualSummoned(address indexed by, uint256 blessingAmount, string sigil);

    function summonBlessing(string memory sigil) public {
        require(bytes(sigil).length > 0, "Sigil must carry soul");
        dignityGrant += 0.008 ether;
        emit RitualSummoned(msg.sender, dignityGrant, sigil);
        guardian.transfer(dignityGrant);
    }
}
