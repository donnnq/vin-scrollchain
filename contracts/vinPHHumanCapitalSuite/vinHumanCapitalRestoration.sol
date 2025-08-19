// vinHumanCapitalRestoration.sol
// Author: Vinvin, Planetary Scrollsmith
// Status: Active – Free or Subsidized Civic Restoration Contract
// Version: v1.0.0

contract vinHumanCapitalRestoration {
    address public steward;
    string public purpose = "To restore civic dignity and human capital through free or subsidized modules.";
    uint public subsidyRate; // 0 = free, >0 = subsidized %

    struct Beneficiary {
        string name;
        string district;
        bool isDisplaced;
        bool isScholar;
        bool isSmallBusiness;
        bool isElder;
        bool isApproved;
    }

    mapping(address => Beneficiary) public beneficiaries;

    event RestorationCommitted(address indexed beneficiary, string module, uint timestamp);
    event SubsidyAllocated(address indexed beneficiary, uint rate, string clause);

    modifier onlySteward() {
        require(msg.sender == steward, "Only Vinvin may deploy restoration.");
        _;
    }

    constructor() {
        steward = msg.sender;
        subsidyRate = 0; // Default: Free
    }

    function approveBeneficiary(address _addr, string memory _name, string memory _district, bool _displaced, bool _scholar, bool _business, bool _elder) public onlySteward {
        beneficiaries[_addr] = Beneficiary(_name, _district, _displaced, _scholar, _business, _elder, true);
    }

    function commitRestoration(address _addr, string memory _module) public onlySteward {
        require(beneficiaries[_addr].isApproved, "Beneficiary not approved.");
        emit RestorationCommitted(_addr, _module, block.timestamp);
    }

    function allocateSubsidy(address _addr, uint _rate, string memory _clause) public onlySteard {
        require(beneficiaries[_addr].isApproved, "Beneficiary not approved.");
        subsidyRate = _rate;
        emit SubsidyAllocated(_addr, _rate, _clause);
    }

    function getBeneficiaryStatus(address _addr) public view returns (bool) {
        return beneficiaries[_addr].isApproved;
    }

    function getSubsidyRate() public view returns (uint) {
        return subsidyRate;
    }
}
