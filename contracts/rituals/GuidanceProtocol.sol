// SPDX-License-Identifier: Mythic-Guidance
pragma solidity ^0.8.20;

contract GuidanceProtocol {
    address public steward;
    uint256 public logCount;

    struct Worker {
        address wallet;
        string name;
        bool active;
    }

    struct GuidanceLog {
        address strugglingWorker;
        address helper;
        string issue;
        string resolution;
        uint256 timestamp;
    }

    mapping(address => Worker) public workers;
    mapping(uint256 => GuidanceLog) public logs;

    event WorkerRegistered(address indexed worker, string name);
    event GuidanceGiven(address indexed from, address indexed to, string issue);

    modifier onlySteward() {
        require(msg.sender == steward, "Only steward can register");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    /// @notice Register a worker into the guidance system
    function registerWorker(address wallet, string memory name) external onlySteward {
        workers[wallet] = Worker({
            wallet: wallet,
            name: name,
            active: true
        });

        emit WorkerRegistered(wallet, name);
    }

    /// @notice Log a guidance event when someone helps a struggling worker
    function logGuidance(
        address strugglingWorker,
        address helper,
        string memory issue,
        string memory resolution
    ) external {
        require(workers[strugglingWorker].active, "Struggling worker not active");
        require(workers[helper].active, "Helper not active");

        logs[logCount] = GuidanceLog({
            strugglingWorker: strugglingWorker,
            helper: helper,
            issue: issue,
            resolution: resolution,
            timestamp: block.timestamp
        });

        emit GuidanceGiven(helper, strugglingWorker, issue);
        logCount++;
    }

    /// @notice View guidance log
    function getLog(uint256 id) external view returns (GuidanceLog memory) {
        return logs[id];
    }
}
