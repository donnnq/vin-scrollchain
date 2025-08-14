// SPDX-License-Identifier: Civic-Restoration
pragma solidity ^0.8.0;

contract WorkerOnboarding {
    address public steward;
    mapping(address => Worker) public workers;

    struct Worker {
        string name;
        string role;
        bool soulbound;
        uint256 emotionalAPR;
        string civicVow;
        string onboardingBlessing;
        bool housingPerk;
        bool emergencyAid;
        bool mentorshipAccess;
    }

    event WorkerBlessed(address indexed worker, string name, string role);
    event TrustRestored(address indexed worker, string civicVow);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized steward");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function blessWorker(
        address _worker,
        string memory _name,
        string memory _role,
        string memory _civicVow,
        string memory _onboardingBlessing,
        bool _housingPerk,
        bool _emergencyAid,
        bool _mentorshipAccess
    ) public onlySteward {
        workers[_worker] = Worker({
            name: _name,
            role: _role,
            soulbound: true,
            emotionalAPR: 108,
            civicVow: _civicVow,
            onboardingBlessing: _onboardingBlessing,
            housingPerk: _housingPerk,
            emergencyAid: _emergencyAid,
            mentorshipAccess: _mentorshipAccess
        });

        emit WorkerBlessed(_worker, _name, _role);
        emit TrustRestored(_worker, _civicVow);
    }

    function viewWorker(address _worker) public view returns (Worker memory) {
        return workers[_worker];
    }
}
