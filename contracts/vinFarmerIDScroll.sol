contract vinFarmerIDScroll {
    struct FarmerID {
        address farmer;
        string name;
        string region;
        bytes32 soulPrint; // hash of biometric or symbolic scroll
        uint256 birthMoonCycle;
        bool active;
    }

    mapping(address => FarmerID) public farmerIdentities;

    event IdentityRegistered(address indexed farmer, string name);
    event IdentityActivated(address indexed farmer);

    function registerIdentity(address _farmer, string memory _name, string memory _region, bytes32 _soulPrint, uint256 _birthMoonCycle) public {
        farmerIdentities[_farmer] = FarmerID(_farmer, _name, _region, _soulPrint, _birthMoonCycle, true);
        emit IdentityRegistered(_farmer, _name);
    }

    function activateIdentity(address _farmer) public {
        farmerIdentities[_farmer].active = true;
        emit IdentityActivated(_farmer);
    }

    function viewIdentity(address _farmer) public view returns (FarmerID memory) {
        return farmerIdentities[_farmer];
    }
}
