contract vinFarmerPerformancePay {
    struct Farmer {
        address wallet;
        uint256 basePay;
        uint256 performanceScore;
        uint256 bonus;
    }

    mapping(address => Farmer) public farmers;

    event PerformanceUpdated(address indexed farmer, uint256 score);
    event BonusCalculated(address indexed farmer, uint256 bonus);

    function registerFarmer(address _wallet, uint256 _basePay) public {
        farmers[_wallet] = Farmer(_wallet, _basePay, 0, 0);
    }

    function updatePerformance(address _wallet, uint256 _score) public {
        require(_score <= 100, "Score must be between 0 and 100");
        farmers[_wallet].performanceScore = _score;
        emit PerformanceUpdated(_wallet, _score);
    }

    function calculateBonus(address _wallet) public {
        Farmer storage f = farmers[_wallet];
        f.bonus = (f.basePay * f.performanceScore) / 100;
        emit BonusCalculated(_wallet, f.bonus);
    }

    function getTotalPay(address _wallet) public view returns (uint256) {
        Farmer memory f = farmers[_wallet];
        return f.basePay + f.bonus;
    }
}
