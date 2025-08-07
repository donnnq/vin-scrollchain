pragma solidity ^0.8.0;

contract vinAgriSupportSuite {
    address public steward;
    uint256 public updateCount;

    struct FarmerProfile {
        address farmer;
        string region;
        uint256 monthlySalary;
        bool active;
        uint256 lastUpdated;
    }

    struct FarmingUpdate {
        uint256 id;
        address farmer;
        string updateText;
        string requiredResources;
        uint256 timestamp;
    }

    mapping(address => FarmerProfile) public farmers;
    FarmingUpdate[] public updates;

    event FarmerRegistered(address indexed farmer);
    event UpdateLogged(address indexed farmer, string updateText);
    event SalaryClaimed(address indexed farmer, uint256 amount);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized.");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function registerFarmer(address _farmer, string memory _region, uint256 _monthlySalary) public onlySteward {
        farmers[_farmer] = FarmerProfile(_farmer, _region, _monthlySalary, true, block.timestamp);
        emit FarmerRegistered(_farmer);
    }

    function logUpdate(string memory _updateText, string memory _requiredResources) public {
        require(farmers[msg.sender].active, "Not a registered farmer.");
        updateCount++;
        updates.push(FarmingUpdate(updateCount, msg.sender, _updateText, _requiredResources, block.timestamp));
        farmers[msg.sender].lastUpdated = block.timestamp;

        emit UpdateLogged(msg.sender, _updateText);
    }

    function claimSalary() public {
        FarmerProfile storage farmer = farmers[msg.sender];
        require(farmer.active, "Inactive farmer.");
        require(block.timestamp >= farmer.lastUpdated + 30 days, "Salary not yet available.");

        emit SalaryClaimed(msg.sender, farmer.monthlySalary);
        farmer.lastUpdated = block.timestamp;
        // Transfer function handled by external steward system.
    }

    function getAllUpdates() public view returns (FarmingUpdate[] memory) {
        return updates;
    }

    function viewFarmer(address _farmer) public view returns (FarmerProfile memory) {
        return farmers[_farmer];
    }
}
