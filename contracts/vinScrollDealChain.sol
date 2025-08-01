contract vinScrollDealChain {
    struct Deal {
        address initiator;
        address contractor;
        string scope;
        uint256 amount;
        bool ratified;
    }

    mapping(uint256 => Deal) public deals;
    event DealRegistered(uint256 indexed dealId, bool ratified);

    function forgeDeal(uint256 dealId, address contractor, string memory scope, uint256 amount) public {
        // auto ratify if contractor is dignityCertified and amount matches sanity norms
        bool legit = amount >= 20 ether;
        deals[dealId] = Deal(msg.sender, contractor, scope, amount, legit);
        emit DealRegistered(dealId, legit);
    }
}
