// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinWorkBlessing {
    address public scrollsmith;
    uint public blessingCount;

    struct CareerBlessing {
        string traineeName;
        string skillCompleted;
        string matchedJob;
        string employerName;
        bool onboardingConfirmed;
        uint dateBlessed;
    }

    mapping(uint => CareerBlessing) public workScrolls;

    event WorkBlessed(string traineeName, string matchedJob, string employerName);
    event OnboardingConfirmed(uint blessingId);
    event ScrollsmithTransferred(address oldScrollsmith, address newScrollsmith);

    constructor() {
        scrollsmith = msg.sender;
        blessingCount = 0;
    }

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Only scrollsmith may grant career blessings.");
        _;
    }

    // 🎓 Log a graduate with matched job and employer
    function blessCareerJourney(
        string memory traineeName,
        string memory skillCompleted,
        string memory matchedJob,
        string memory employerName
    ) public onlyScrollsmith {
        workScrolls[blessingCount++] = CareerBlessing(
            traineeName,
            skillCompleted,
            matchedJob,
            employerName,
            false,
            block.timestamp
        );
        emit WorkBlessed(traineeName, matchedJob, employerName);
    }

    // ✅ Confirm onboarding success
    function confirmOnboarding(uint blessingId) public onlyScrollsmith {
        require(blessingId < blessingCount, "Invalid blessing ID.");
        workScrolls[blessingId].onboardingConfirmed = true;
        emit OnboardingConfirmed(blessingId);
    }

    // 🔍 View graduate journey info
    function getWorkBlessing(uint id) public view returns (
        string memory traineeName,
        string memory skillCompleted,
        string memory matchedJob,
        string memory employerName,
        bool onboardingConfirmed,
        uint dateBlessed
    ) {
        CareerBlessing memory cb = workScrolls[id];
        return (
            cb.traineeName,
            cb.skillCompleted,
            cb.matchedJob,
            cb.employerName,
            cb.onboardingConfirmed,
            cb.dateBlessed
        );
    }

    // 🔄 Transfer scrollsmith rights
    function transferScrollsmith(address newScrollsmith) public onlyScrollsmith {
        require(newScrollsmith != address(0), "Invalid scrollsmith address.");
        emit ScrollsmithTransferred(scrollsmith, newScrollsmith);
        scrollsmith = newScrollsmith;
    }

    // 📊 View total blessings granted
    function totalBlessings() public view returns (uint) {
        return blessingCount;
    }
}
