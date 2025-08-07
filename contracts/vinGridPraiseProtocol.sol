// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinGridPraiseProtocol
/// @dev Awards praise tokens for environmental and energy stewardship

contract vinGridPraiseProtocol {
    address public praiseAdmin;
    uint256 public totalPraiseTokens;

    struct Barangay {
        string name;
        uint256 energyScore;
        uint256 cleanlinessScore;
        uint256 wasteScore;
        uint256 totalPraise;
    }

    mapping(string => Barangay) public barangays;

    event PraiseAssigned(string indexed barangayName, uint256 totalPraise);
    event WeeklyAuditPerformed(string indexed barangayName);

    modifier onlyAdmin() {
        require(msg.sender == praiseAdmin, "Only admin can execute");
        _;
    }

    constructor(uint256 initialTokens) {
        praiseAdmin = msg.sender;
        totalPraiseTokens = initialTokens;
    }

    function registerBarangay(string memory name) public onlyAdmin {
        barangays[name] = Barangay(name, 0, 0, 0, 0);
    }

    function submitScores(
        string memory name,
        uint256 energyScore,
        uint256 cleanlinessScore,
        uint256 wasteScore
    ) public onlyAdmin {
        require(energyScore <= 100, "Max score is 100");
        require(cleanlinessScore <= 100, "Max score is 100");
        require(wasteScore <= 100, "Max score is 100");

        Barangay storage b = barangays[name];
        b.energyScore = energyScore;
        b.cleanlinessScore = cleanlinessScore;
        b.wasteScore = wasteScore;

        uint256 total = energyScore + cleanlinessScore + wasteScore;
        uint256 praise = (total * totalPraiseTokens) / 30000;
        b.totalPraise += praise;
        totalPraiseTokens -= praise;

        emit PraiseAssigned(name, praise);
        emit WeeklyAuditPerformed(name);
    }

    function viewBarangayPraise(string memory name) public view returns (Barangay memory) {
        return barangays[name];
    }

    function refillPraisePool(uint256 amount) public onlyAdmin {
        totalPraiseTokens += amount;
    }
}
