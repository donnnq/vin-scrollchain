contract vinWorkerReentryBlessing {
    struct Worker {
        string name;
        string previousRole;
        string displacedDate;
        string emotionalAPR;
        string desiredRole;
        string skillSet;
        bool isBlessed;
    }

    struct Employer {
        string companyName;
        string vacantRole;
        string dignityScore;
        bool isVerifiedSanctuary;
    }

    mapping(address => Worker) public workers;
    mapping(address => Employer) public employers;

    event WorkerBlessed(address indexed worker, string roleMatched, string emotionalAPR);
    event EmployerSanctified(address indexed employer, string vacantRole, string dignityScore);

    function blessWorker(address _worker, string memory _desiredRole, string memory _emotionalAPR) public {
        workers[_worker].desiredRole = _desiredRole;
        workers[_worker].emotionalAPR = _emotionalAPR;
        workers[_worker].isBlessed = true;
        emit WorkerBlessed(_worker, _desiredRole, _emotionalAPR);
    }

    function sanctifyEmployer(address _employer, string memory _vacantRole, string memory _dignityScore) public {
        employers[_employer].vacantRole = _vacantRole;
        employers[_employer].dignityScore = _dignityScore;
        employers[_employer].isVerifiedSanctuary = true;
        emit EmployerSanctified(_employer, _vacantRole, _dignityScore);
    }

    function matchWorkerToRole(address _worker, address _employer) public view returns (string memory) {
        require(workers[_worker].isBlessed, "Worker not yet blessed");
        require(employers[_employer].isVerifiedSanctuary, "Employer not sanctified");
        return employers[_employer].vacantRole;
    }
}
