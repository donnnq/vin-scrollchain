pragma mythic;

contract ScrollchainHousingRelief {
    struct HousingBlessing {
        string recipientName;
        string region;
        uint256 originalRate;
        uint256 newRate;
        string blessingMessage;
        bool rateAdjusted;
        uint256 timestamp;
    }

    mapping(string => HousingBlessing) public reliefLedger;

    event InterestRateReduced(string recipientName, uint256 newRate);

    function reduceInterestRate(
        string memory _name,
        string memory _region,
        uint256 _originalRate,
        string memory _message
    ) public {
        require(_originalRate > 0.5, "Rate already low");

        reliefLedger[_name] = HousingBlessing(
            _name,
            _region,
            _originalRate,
            0.5,
            _message,
            true,
            block.timestamp
        );

        emit InterestRateReduced(_name, 0.5);
    }

    function getHousingBlessing(string memory _name) public view returns (
        string memory, string memory, uint256, uint256, string memory, bool, uint256
    ) {
        HousingBlessing memory b = reliefLedger[_name];
        return (
            b.recipientName,
            b.region,
            b.originalRate,
            b.newRate,
            b.blessingMessage,
            b.rateAdjusted,
            b.timestamp
        );
    }
}
