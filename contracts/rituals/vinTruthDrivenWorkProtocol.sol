// SPDX-License-Identifier: Mythic-Scrollsmith
pragma solidity ^0.8.0;

/// @title vinTruthDrivenWorkProtocol
/// @author Vinvin
/// @notice Rewards verified truth-spitting and emotional resonance in the workplace
/// @dev Designed for global deployment across agencies, companies, and civic systems

contract vinTruthDrivenWorkProtocol {
    address public steward;

    struct Worker {
        address wallet;
        string name;
        uint256 truthPoints;
        uint256 bonusEarned;
        bool isActive;
    }

    mapping(address => Worker) public workers;

    event TruthSpit(address indexed worker, uint256 pointsAdded, string truthType);
    event BonusReleased(address indexed worker, uint256 amount);

    modifier onlySteward() {
        require(msg.sender == steward, "Not scrollsmith-authorized");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function onboardWorker(address _wallet, string memory _name) external onlySteward {
        workers[_wallet] = Worker({
            wallet: _wallet,
            name: _name,
            truthPoints: 0,
            bonusEarned: 0,
            isActive: true
        });
    }

    function spitTruth(address _wallet, uint256 _points, string memory _truthType) external onlySteward {
        require(workers[_wallet].isActive, "Worker not active");
        workers[_wallet].truthPoints += _points;
        emit TruthSpit(_wallet, _points, _truthType);
    }

    function releaseBonus(address _wallet, uint256 _amount) external onlySteward {
        require(workers[_wallet].isActive, "Worker not active");
        workers[_wallet].bonusEarned += _amount;
        emit BonusReleased(_wallet, _amount);
    }

    function getWorkerStats(address _wallet) external view returns (
        string memory name,
        uint256 truthPoints,
        uint256 bonusEarned,
        bool isActive
    ) {
        Worker memory w = workers[_wallet];
        return (w.name, w.truthPoints, w.bonusEarned, w.isActive);
    }
}
