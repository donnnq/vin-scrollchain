// SPDX-License-Identifier: Mythic-Scrollsmith
pragma solidity ^0.8.0;

contract LanggamLaborEmpowerment {
    struct Worker {
        address soulbound;
        uint hourlyRate;
        uint hoursWorked;
        uint circleScore; // 0 to 100
        uint bonus;
        bool isBlessed;
    }

    mapping(address => Worker) public workers;
    address public steward;

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized scrollsmith");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function onboardWorker(address _worker, uint _hourlyRate) external onlySteward {
        workers[_worker] = Worker(_worker, _hourlyRate, 0, 0, 0, false);
    }

    function logWork(address _worker, uint _hours, uint _circleScore) external onlySteward {
        Worker storage w = workers[_worker];
        w.hoursWorked += _hours;
        w.circleScore = _circleScore;

        // Bonus logic: if circleScore >= 60, grant bonus
        if (_circleScore >= 60) {
            w.bonus += (_hours * w.hourlyRate) / 5; // 20% bonus
            w.isBlessed = true;
        }
    }

    function calculatePay(address _worker) external view returns (uint totalPay) {
        Worker memory w = workers[_worker];
        totalPay = (w.hoursWorked * w.hourlyRate) + w.bonus;
    }

    function resetCycle(address _worker) external onlySteward {
        Worker storage w = workers[_worker];
        w.hoursWorked = 0;
        w.circleScore = 0;
        w.bonus = 0;
        w.isBlessed = false;
    }
}
