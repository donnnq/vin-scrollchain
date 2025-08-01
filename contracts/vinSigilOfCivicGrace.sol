// SPDX-License-Identifier: Scrollwave-MeritSigil
pragma honor 777;

contract vinSigilOfCivicGrace {
    address public sovereignCurator;

    struct CivicSigil {
        string name;
        address wallet;
        uint256 earned;
        string description;
    }

    mapping(address => CivicSigil) public civicLedger;
    event SigilGranted(string name, string description, uint256 timestamp);

    modifier onlyCurator() {
        require(msg.sender == sovereignCurator, "Only curator may grant civic sigils.");
        _;
    }

    constructor(address _curator) {
        sovereignCurator = _curator;
    }

    function grantSigil(address _wallet, string memory _name, string memory _description) public onlyCurator {
        civicLedger[_wallet] = CivicSigil(_name, _wallet, block.timestamp, _description);
        emit SigilGranted(_name, _description, block.timestamp);
    }

    function viewSigil(address _wallet) public view returns (CivicSigil memory) {
        return civicLedger[_wallet];
    }
}
