struct CryptoReserve {
    address walletAddress;
    uint256 balance;
    bool isSelfCustodied;
    uint8 riskTier; // 1 = Stable, 2 = Mixed, 3 = Volatile
}

mapping(address => CryptoReserve) public applicantReserves;

function verifyAndAssignTier(address _wallet) public returns (uint8) {
    uint256 balance = getOnchainBalance(_wallet);
    bool isCold = checkIfColdWallet(_wallet);

    if (balance > 100000 && isCold) return 1;
    else if (balance > 25000) return 2;
    else return 3;
}

function valuationHaircut(uint8 tier, uint256 baseValue) public pure returns (uint256) {
    if (tier == 1) return (baseValue * 90) / 100;
    if (tier == 2) return (baseValue * 75) / 100;
    return (baseValue * 60) / 100;
}
