// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinPayrollUpgradeScroll {
    struct Worker {
        address wallet;
        string name;
        uint256 baseSalary;
        uint256 boostedSalary;
        string status; // "Trial", "Extended", "Permanent"
        uint256 startDate;
    }

    mapping(address => Worker) public workers;
    address[] public roster;

    event WorkerOnboarded(address wallet, string name, uint256 boostedSalary, string status);
    event StatusUpgraded(address wallet, string newStatus);

    function onboardWorker(address wallet, string memory name, uint256 baseSalary) public {
        require(workers[wallet].wallet == address(0), "Already onboarded.");
        uint256 boosted = (baseSalary * 125) / 100; // +25% boost
        workers[wallet] = Worker(wallet, name, baseSalary, boosted, "Trial", block.timestamp);
        roster.push(wallet);
        emit WorkerOnboarded(wallet, name, boosted, "Trial");
    }

    function upgradeStatus(address wallet) public {
        require(workers[wallet].wallet != address(0), "Worker not found.");
        string memory current = workers[wallet].status;
        if (keccak256(bytes(current)) == keccak256("Trial")) {
            workers[wallet].status = "Extended";
        } else if (keccak256(bytes(current)) == keccak256("Extended")) {
            workers[wallet].status = "Permanent";
        }
        emit StatusUpgraded(wallet, workers[wallet].status);
    }

    function getWorker(address wallet) public view returns (
        string memory, uint256, uint256, string memory, uint256
    ) {
        Worker memory w = workers[wallet];
        return (w.name, w.baseSalary, w.boostedSalary, w.status, w.startDate);
    }

    function totalWorkers() public view returns (uint) {
        return roster.length;
    }
}
