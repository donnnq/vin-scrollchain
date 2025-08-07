pragma solidity ^0.8.0;

contract vinAgencyGratitudeTracker {
    address public steward;
    uint256 public maxVotesPerWorker = 5;

    struct WorkerPraise {
        address worker;
        string name;
        string agency;
        uint256 totalPraise;
        uint256 surpriseScrolls;
        bool sigilUpgraded;
    }

    mapping(address => WorkerPraise) public praises;
    mapping(address => mapping(address => bool)) public hasPraised;

    event PraiseGiven(address indexed voter, address indexed worker);
    event SigilUpgradeTriggered(address indexed worker, string name);

    function givePraise(address _worker, string memory _name, string memory _agency) public {
        require(!hasPraised[msg.sender][_worker], "Already praised");

        WorkerPraise storage praise = praises[_worker];
        praise.worker = _worker;
        praise.name = _name;
        praise.agency = _agency;
        praise.totalPraise += 1;
        hasPraised[msg.sender][_worker] = true;

        if (praise.totalPraise % 3 == 0 && !praise.sigilUpgraded) {
            praise.sigilUpgraded = true;
            praise.surpriseScrolls += 1;
            emit SigilUpgradeTriggered(_worker, _name);
        }

        emit PraiseGiven(msg.sender, _worker);
    }

    function viewPraise(address _worker) public view returns (WorkerPraise memory) {
        return praises[_worker];
    }
}
