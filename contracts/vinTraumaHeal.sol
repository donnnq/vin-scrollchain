contract vinTraumaHeal {
    mapping(address => string[]) public testimonies;
    mapping(address => uint256) public empathyStake;
    event GriefValidated(address soul);

    function offerTestimony(string memory _hash) public {
        testimonies[msg.sender].push(_hash);
        empathyStake[msg.sender] += 1;
        emit GriefValidated(msg.sender);
    }

    function stakeEmpathyToken(address beneficiary) public {
        empathyStake[beneficiary] += 1;
    }
}
