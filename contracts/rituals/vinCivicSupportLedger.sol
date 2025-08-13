// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinCivicSupportLedger {
    struct SupportProfile {
        string name;
        bool housingActive;
        uint256 housingBalance;
        bool aidActive;
        uint256 aidBalance;
        bool educationSupport;
        uint256 discountRate;
        string status; // "Trial", "Extended", "Permanent"
        uint256 timestamp;
    }

    mapping(address => SupportProfile) public supportLedger;
    address[] public roster;

    event ProfileCreated(address indexed worker, string name, string status);
    event HousingUpdated(address indexed worker, uint256 balance);
    event AidUpdated(address indexed worker, uint256 balance);
    event EducationGranted(address indexed worker);
    event DiscountApplied(address indexed worker, uint256 rate);

    function createProfile(address worker, string memory name, string memory status) public {
        require(supportLedger[worker].timestamp == 0, "Profile exists.");
        uint256 discount = keccak256(bytes(status)) == keccak256("Permanent") ? 30 : 15;
        supportLedger[worker] = SupportProfile(name, false, 0, false, 0, false, discount, status, block.timestamp);
        roster.push(worker);
        emit ProfileCreated(worker, name, status);
        emit DiscountApplied(worker, discount);
    }

    function updateHousing(address worker, uint256 balance) public {
        supportLedger[worker].housingActive = true;
        supportLedger[worker].housingBalance = balance;
        emit HousingUpdated(worker, balance);
    }

    function updateAid(address worker, uint256 balance) public {
        supportLedger[worker].aidActive = true;
        supportLedger[worker].aidBalance = balance;
        emit AidUpdated(worker, balance);
    }

    function grantEducationSupport(address worker) public {
        supportLedger[worker].educationSupport = true;
        emit EducationGranted(worker);
    }

    function getProfile(address worker) public view returns (
        string memory, bool, uint256, bool, uint256, bool, uint256, string memory, uint256
    ) {
        SupportProfile memory p = supportLedger[worker];
        return (
            p.name,
            p.housingActive,
            p.housingBalance,
            p.aidActive,
            p.aidBalance,
            p.educationSupport,
            p.discountRate,
            p.status,
            p.timestamp
        );
    }

    function totalProfiles() public view returns (uint) {
        return roster.length;
    }
}
