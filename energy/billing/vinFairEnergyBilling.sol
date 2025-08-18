contract vinFairEnergyBilling {
    address public steward;
    uint public baseRatePerKWh;
    mapping(address => uint) public consumptionLog;
    mapping(address => uint) public billingLedger;
    mapping(address => bool) public isBlessed;

    event ConsumptionLogged(address user, uint kWh);
    event BillGenerated(address user, uint amount);
    event BlessingApplied(address user, uint discount);

    constructor(uint _baseRatePerKWh) {
        steward = msg.sender;
        baseRatePerKWh = _baseRatePerKWh;
    }

    function logConsumption(address _user, uint _kWh) public {
        consumptionLog[_user] += _kWh;
        emit ConsumptionLogged(_user, _kWh);
    }

    function generateBill(address _user) public {
        uint total = consumptionLog[_user] * baseRatePerKWh;
        if (isBlessed[_user]) {
            uint discount = total / 5; // 20% discount
            total -= discount;
            emit BlessingApplied(_user, discount);
        }
        billingLedger[_user] = total;
        emit BillGenerated(_user, total);
    }

    function applyBlessing(address _user) public {
        isBlessed[_user] = true;
    }

    function getBill(address _user) public view returns (uint) {
        return billingLedger[_user];
    }
}
