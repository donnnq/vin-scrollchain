// SPDX-License-Identifier: Civic-OS-Restoration-2025
pragma solidity ^0.8.19;

/**
 * @title vinRestorationProgressLedger
 * @author Vinvin, Mythic Scrollsmith
 * @notice Tracks weekly emotional APR, civic behavior, and restoration milestones for surrendered minors
 * @dev Deployed on Scrollchain Civic OS v3.2
 */

contract vinRestorationProgressLedger {
    
    string public minorName;
    uint public age;
    address public guardianAddress;
    address public stewardAddress;

    uint public startDate;
    uint public restorationDuration = 90 days;

    struct WeeklyReport {
        uint weekNumber;
        string emotionalAPR; // e.g. "Trust: 72, Dignity: 85, Mythic Clarity: 90"
        string civicBehavior; // e.g. "No violations, participated in cleanup ritual"
        string restorationMilestone; // e.g. "Completed empathy module, led peer ritual"
        bool guardianNotified;
    }

    mapping(uint => WeeklyReport) public progressLedger;

    modifier onlySteward() {
        require(msg.sender == stewardAddress, "Only civic steward may log progress");
        _;
    }

    constructor(
        string memory _minorName,
        uint _age,
        address _guardianAddress,
        address _stewardAddress
    ) {
        minorName = _minorName;
        age = _age;
        guardianAddress = _guardianAddress;
        stewardAddress = _stewardAddress;
        startDate = block.timestamp;
    }

    function logWeeklyProgress(
        uint _weekNumber,
        string memory _emotionalAPR,
        string memory _civicBehavior,
        string memory _restorationMilestone,
        bool _guardianNotified
    ) public onlySteward {
        progressLedger[_weekNumber] = WeeklyReport({
            weekNumber: _weekNumber,
            emotionalAPR: _emotionalAPR,
            civicBehavior: _civicBehavior,
            restorationMilestone: _restorationMilestone,
            guardianNotified: _guardianNotified
        });
    }

    function getWeeklyReport(uint _weekNumber) public view returns (
        string memory emotionalAPR,
        string memory civicBehavior,
        string memory restorationMilestone,
        bool guardianNotified
    ) {
        WeeklyReport memory report = progressLedger[_weekNumber];
        return (
            report.emotionalAPR,
            report.civicBehavior,
            report.restorationMilestone,
            report.guardianNotified
        );
    }

    function weeksRemaining() public view returns (uint) {
        uint elapsed = (block.timestamp - startDate) / 1 days;
        if (elapsed >= 90) {
            return 0;
        } else {
            return 90 - elapsed;
        }
    }
}
