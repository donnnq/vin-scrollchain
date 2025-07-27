// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinTowerBridge {
    struct Resident {
        string name;
        uint256 houseNumber;
        bool claimedKey;
        string onboardingMethod;
    }

    mapping(address => Resident) public residents;
    address public barangayOracle;
    uint256 public totalUnits;
    uint256 public unitsClaimed;

    event KeyClaimed(address indexed resident, uint256 houseNumber, string ritual);
    event ResidentOnboarded(address indexed resident, string method);

    constructor(uint256 _totalUnits) {
        barangayOracle = msg.sender;
        totalUnits = _totalUnits;
    }

    modifier onlyOracle() {
        require(msg.sender == barangayOracle, "Not authorized: Call the Oracle.");
        _;
    }

    function onboardResident(address _addr, string memory _name, string memory _method, uint256 _houseNumber) public onlyOracle {
        require(_houseNumber <= totalUnits, "Invalid unit number.");
        residents[_addr] = Resident(_name, _houseNumber, false, _method);
        emit ResidentOnboarded(_addr, _method);
    }

    function claimKey(uint256 _houseNumber) public {
        Resident storage r = residents[msg.sender];
        require(r.houseNumber == _houseNumber, "Wrong coordinate: try again.");
        require(!r.claimedKey, "Key already claimed.");

        r.claimedKey = true;
        unitsClaimed += 1;
        emit KeyClaimed(msg.sender, _houseNumber, "Fingerprint Scroll Verified");
    }

    function getResidentInfo(address _addr) public view returns (string memory, uint256, bool, string memory) {
        Resident memory r = residents[_addr];
        return (r.name, r.houseNumber, r.claimedKey, r.onboardingMethod);
    }
}
