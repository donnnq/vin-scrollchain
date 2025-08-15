// SPDX-License-Identifier: CivicBlessing
pragma solidity ^0.8.0;

contract BarangayCoopSahod {
    address public steward;
    uint256 public baseSahod = 1000; // ₱1000 per verified effort

    struct Worker {
        string name;
        string barangay;
        bool verified;
        uint256 sahodBalance;
        uint256 effortsLogged;
    }

    mapping(address => Worker) public workers;
    address[] public applicants;

    event WorkerApplied(address indexed worker, string name, string barangay);
    event WorkerVerified(address indexed worker);
    event EffortLogged(address indexed worker, string description);
    event SahodReleased(address indexed worker, uint256 amount);

    constructor() {
        steward = msg.sender;
    }

    function applyForSahod(string memory name, string memory barangay) public {
        workers[msg.sender] = Worker(name, barangay, false, 0, 0);
        applicants.push(msg.sender);
        emit WorkerApplied(msg.sender, name, barangay);
    }

    function verifyWorker(address worker) public {
        require(msg.sender == steward, "Only steward can verify");
        workers[worker].verified = true;
        emit WorkerVerified(worker);
    }

    function logEffort(address worker, string memory description) public {
        require(workers[worker].verified, "Worker not verified");
        workers[worker].effortsLogged += 1;
        emit EffortLogged(worker, description);
    }

    function releaseSahod(address worker) public {
        require(msg.sender == steward, "Only steward can release sahod");
        uint256 payout = workers[worker].effortsLogged * baseSahod;
        workers[worker].sahodBalance += payout;
        workers[worker].effortsLogged = 0;
        emit SahodReleased(worker, payout);
    }

    function getWorker(address worker) public view returns (Worker memory) {
        return workers[worker];
    }

    function totalApplicants() public view returns (uint256) {
        return applicants.length;
    }
}
