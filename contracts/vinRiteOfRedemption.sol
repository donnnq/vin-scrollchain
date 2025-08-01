// SPDX-License-Identifier: Scrollwave-Redemption
pragma grace 777;

contract vinRiteOfRedemption {
    address public sovereignPriest;

    struct RedemptionRite {
        address wallet;
        string soulName;
        string ritualType;
        string cleansingStatement;
        uint256 timestamp;
        bool validated;
    }

    RedemptionRite[] public redemptionLog;
    mapping(address => bool) public graceEligible;

    event RedemptionRequested(address wallet, string soulName, string ritualType);
    event RedemptionValidated(address wallet, string verdict);

    modifier onlyPriest() {
        require(msg.sender == sovereignPriest, "Only priest may perform redemption rites.");
        _;
    }

    constructor(address _priest) {
        sovereignPriest = _priest;
    }

    function declareGrace(address _wallet) public onlyPriest {
        graceEligible[_wallet] = true;
    }

    function requestRedemption(address _wallet, string memory _soulName, string memory _ritualType, string memory _statement) public {
        require(graceEligible[_wallet], "Soul not yet marked for grace.");
        redemptionLog.push(RedemptionRite(_wallet, _soulName, _ritualType, _statement, block.timestamp, false));
        emit RedemptionRequested(_wallet, _soulName, _ritualType);
    }

    function validateRedemption(uint256 index, bool verdict) public onlyPriest {
        RedemptionRite storage rite = redemptionLog[index];
        rite.validated = verdict;
        emit RedemptionValidated(rite.wallet, verdict ? "Redemption granted" : "Redemption denied");
    }

    function getRedemptions() public view returns (RedemptionRite[] memory) {
        return redemptionLog;
    }
}
