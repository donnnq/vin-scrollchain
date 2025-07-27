contract vinHerbalInsuranceVault {
    struct Claim {
        address claimant;
        string strainLinked;
        uint256 amountRequested;
        bool approved;
    }

    Claim[] public claims;
    uint256 public daoPool;

    function fundDAO() external payable {
        daoPool += msg.value;
    }

    function fileClaim(string calldata strainLinked, uint256 amountRequested) external {
        claims.push(Claim(msg.sender, strainLinked, amountRequested, false));
    }

    function approveClaim(uint claimId) external {
        Claim storage c = claims[claimId];
        require(!c.approved, "Already approved");
        require(c.amountRequested <= daoPool, "Insufficient pool");
        c.approved = true;
        daoPool -= c.amountRequested;
        payable(c.claimant).transfer(c.amountRequested);
    }
}
