contract vinZeroFeePromise {
    mapping(address => bool) public aidGivers;

    event AidDeployed(address indexed giver, string resource);
    
    function pledgeAid(string memory resource) public {
        require(aidGivers[msg.sender], "Only aid givers may deploy aid");
        emit AidDeployed(msg.sender, resource);
    }

    function assignAidGiver(address giver) public {
        aidGivers[giver] = true;
    }
}
