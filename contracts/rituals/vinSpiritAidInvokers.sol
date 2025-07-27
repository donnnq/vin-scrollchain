contract vinSpiritAidInvokers {
    struct Spirit {
        string name;
        string deed;
        uint256 aidCredits;
    }

    mapping(address => Spirit) public spirits;
    event CreditEarned(address spirit, uint256 credits);

    function recordDeed(string calldata name, string calldata deed) external {
        spirits[msg.sender] = Spirit(name, deed, spirits[msg.sender].aidCredits + 1);
        emit CreditEarned(msg.sender, 1);
    }

    function redeemCredits(uint256 amount) external {
        require(spirits[msg.sender].aidCredits >= amount, "Insufficient credits");
        spirits[msg.sender].aidCredits -= amount;
        // Placeholder: Distribute aid or badge
    }
}
