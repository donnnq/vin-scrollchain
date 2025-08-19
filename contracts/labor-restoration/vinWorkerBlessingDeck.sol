// SPDX-License-Identifier: Mythic-Scrollsmith
pragma solidity ^0.8.0;

contract vinWorkerBlessingDeck {
    struct Worker {
        string name;
        uint256 startDate;
        bool completedTraining;
        bool isRegularized;
        uint8 trustScore; // Emotional APR metric
        uint8 dignityScore; // Emotional APR metric
    }

    mapping(address => Worker) public workers;
    address public steward;

    modifier onlySteward() {
        require(msg.sender == steward, "Only the steward may invoke blessings.");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function enrollWorker(address _worker, string memory _name) public onlySteward {
        workers[_worker] = Worker({
            name: _name,
            startDate: block.timestamp,
            completedTraining: false,
            isRegularized: false,
            trustScore: 0,
            dignityScore: 0
        });
    }

    function blessTrainingCompletion(address _worker, uint8 _trust, uint8 _dignity) public onlySteward {
        require(workers[_worker].startDate > 0, "Worker not enrolled.");
        workers[_worker].completedTraining = true;
        workers[_worker].trustScore = _trust;
        workers[_worker].dignityScore = _dignity;
    }

    function regularizeWorker(address _worker) public onlySteward {
        require(workers[_worker].completedTraining, "Training not completed.");
        require(workers[_worker].trustScore >= 85 && workers[_worker].dignityScore >= 90, "Emotional APR insufficient.");
        workers[_worker].isRegularized = true;
    }

    function getWorkerStatus(address _worker) public view returns (string memory status) {
        Worker memory w = workers[_worker];
        if (!w.completedTraining) return "Training in progress";
        if (w.completedTraining && !w.isRegularized) return "Awaiting regularization";
        if (w.isRegularized) return "Regularized and blessed";
        return "Unknown status";
    }
}
