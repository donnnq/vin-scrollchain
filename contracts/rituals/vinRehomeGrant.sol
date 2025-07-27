// Facilitates grants for repatriation and resettlement
contract vinRehomeGrant {
    struct Beneficiary {
        string name;
        string countryOfOrigin;
        bool eligible;
        uint256 grantAmount;
        bool repatriated;
    }

    mapping(address => Beneficiary) public registry;
    event GrantApproved(address indexed recipient, uint256 amount);
    event RepatriationConfirmed(address indexed recipient, string country);

    address public planner;
    uint256 public baseGrant = 1000 ether;

    constructor() {
        planner = msg.sender;
    }

    function register(address _recipient, string memory _name, string memory _country) public {
        require(msg.sender == planner, "Only planner may register");
        registry[_recipient] = Beneficiary(_name, _country, true, baseGrant, false);
        emit GrantApproved(_recipient, baseGrant);
    }

    function confirmRepatriation(address _recipient) public {
        require(msg.sender == planner, "Only planner may confirm");
        registry[_recipient].repatriated = true;
        emit RepatriationConfirmed(_recipient, registry[_recipient].countryOfOrigin);
    }

    function getStatus(address _recipient) public view returns (string memory status) {
        Beneficiary memory b = registry[_recipient];
        if (!b.eligible) return "Not eligible";
        if (b.repatriated) return "Repatriated and granted";
        return "Pending repatriation";
    }
}
